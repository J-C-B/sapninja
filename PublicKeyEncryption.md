# Introduction #

It is beyond the scope of this WIKI to describe the theory behind public key encryption.  A very good summary can be found at http://en.wikipedia.org/wiki/RSA_(algorithm).

This page has been updated from the original thanks to some coding improvements offered by someone in the community.  Also, I have removed the source code and clunky function modules originally supplied.  Thanks to another community member, I have been shown the wisdom of supplying the code via SAP nuggets.  Follow the instructions below to implement a class called ZNINJA\_RSA\_CLASS, which contains methods and data definitions you need to get going straight away.

You will need to use your own creativity to use the function provided here to encrypt text.  You will also need to generate your own public key, private key and modulus to be secure.  There are tools available on the web that will help you do this.


# Details #
## Installing the ZNINJA\_RSA Nugget ##
If you are unfamiliar with "SAP Nuggets", you need to do a little bit of reading at the following link (this alone will be well worth your while to learn): http://wiki.sdn.sap.com/wiki/display/ABAP/SAPlink+User+Documentation

As a guide to help you, look at the screenshots from this document: http://sapninja.googlecode.com/files/Ninja_SAPlink_Instructions.pdf

  * To continue, you will need to have installed the DDIC and Function Group plug-in nuggets from the code project as shown in the screenshot document.

  * Run transaction SE80 and create a Package called "ZNINJA\_RSA".
    * Package -> Create
    * Package = ZNINJA\_RSA
    * Short Description = SAP Ninja RSA Package
    * Application Component = BC

  * Download the nugget (right-click the link and SAVE) http://sapninja.googlecode.com/svn/trunk/nuggets/NUGG_ZNINJA_RSA.nugg and install it with the ZSAPLINK program.
    * From transaction SA38, run program ZSAPLINK
      * Choose the "Import Nugget" radio button
      * Package Name = ZNINJA\_RSA
      * Nugget File Name - NUGG\_ZNINJA\_RSA.nugg
      * Overwrite Originals = ticked
      * Execute

  * The nugget doesn't populate the ZNINJA\_RSA package objects properly
    * Start transaction SE80 and view Package object ZNINJA\_RSA (double-click it)
    * From the menu, choose _Utilities_ -> _Rebuild Object List_
    * All the package objects will now appear correctly.

  * Activate the DDIC objects used by the class.  Follow the instructions in the document http://sapninja.googlecode.com/files/Ninja_Mass_DDIC_Activation.pdf for instructions.

  * Activate the objects
    * Start transaction SE38 and enter program name _ZNINJA\_RSA\_ACTIVATE_.  Click on the _Activate_ button and then the _Execute_ button.  This will activate the RSA class and methods.

  * Start transaction SE38 and enter the program name _ZNINJA\_RSA\_TEST_.   Click on the _Activate_ button and then the _Execute_ button.  This will execute the test program, which demonstrates how the class can be used for encryption and decryption.

## At it's simplest ##
Assume that we want to encrypt and decrypt the letter "A".  If we translate it to it's ASCII code of 65, the following will illustrate the use of the functions.<br>
Assume the following<br>
<ul><li>Public Key = 17<br>
</li><li>Private Key = 2753<br>
</li><li>Modulus = 3233<br>
<br><br>
To encrypt 65 with the public key<br>
<pre><code>CALL METHOD ZNINJA_RSA_CLASS=&gt;MODEXP<br>
   EXPORTING<br>
      BASE = 65<br>
      KEY = 17<br>
      MODULUS = 3233<br>
   IMPORTING<br>
      RESULT = ENCRYPTED.<br>
<br>
* The resulting encrypted number will be 2790.<br>
</code></pre>
To encrypt 2790 with the private key<br>
<pre><code>CALL METHOD ZNINJA_RSA_CLASS=&gt;MODEXP<br>
   EXPORTING<br>
      BASE = 2790<br>
      KEY = 2753<br>
      MODULUS = 3233<br>
   IMPORTING<br>
      RESULT = DECRYPTED.<br>
ESULT<br>
* The resulting decrypted number will be 65, which is what we started with<br>
</code></pre>
<h1>Hypothetical Example</h1>
</li><li>Say you have an application with an annual license.  Your license checking routine checks to see if license year has expired.  For our example, we are going to issue a license for the year 2011.<br>
</li><li>Using the example keys from the Wikipedia example we decide to use the following keys:<br>
<pre><code>private key = 2753<br>
public key  = 17<br>
modulus     = 3233<br>
</code></pre>
</li><li>You might decide to convert "2011" into zero-padded ASCII codes with 3 digits per character.  The packed string will be 050048049049<br>
</li><li>To stop people from identifying the characters easily by picking repetitions in the encrypted codes, you may decide to encrypt in chunks of 2 characters.  If you make the chunk too big, you risk arithmetic overflow ... happy to accept code improvements.<br>
</li><li>You want to encrypt 050048049049, broken up into the numbers<br>
<pre><code>05<br>
00<br>
48<br>
04<br>
90<br>
49<br>
</code></pre>
</li><li>Using the MODEXP function with private key 2753 (which only you know as the developer) and modulus 3233, you encrypt it to the following numbers, which you might pad out to 4 digits.<br>
<pre><code>3086<br>
0000<br>
0624<br>
1387<br>
1668<br>
2906<br>
1771<br>
</code></pre>
</li><li>So you issue the user with a license key = 3086000006241387166829061771<br>
</li><li>On the other side, your program knows the license is packed in chunks of 4 and it can have the completely-visible public key of 17.<br>
</li><li>Using the MODEXP function with public key 17, which anyone can see, and modulus 3233, you break the license key into groups of four digits (3086, 0000,  ....) and decrypt each one to get back to the original, which you can translate back to 2011 via the ASCII chart.