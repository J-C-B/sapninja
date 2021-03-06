Latest News
January 16, 2015. By way of a final update, the code will remain here indefinitely but I have recently been approached by several people, quite independently of one another, for assistance in standing up a collector for SM19/SM20 logs only. To this end, I have written a very robust standalone application in the Z namespace, which extracts SM20 logs into CSV or Keypair format centrally from all application servers and never duplicates data. I charge 2 days consulting fees ($A2000 excl GST) to provide the code, operational documentation and assistance for the initial deployment. Please contact me directly if this is an option is of interest. No developers are required, the code is supplied as a transport, needing only BASIS to import it and schedule the collection jobs.

December 19 , 2014. Unfortunately, due to a combination of family commitments and the terms of my current employment contract, I am no longer able to contribute code and maintain this site. It's a pity, but my paid employment takes priority. This is a shame because the interest in this project appears to be growing.

December 8 2012. Version 3BETA is available for download. Not all functionality is there yet, for example the RFC is disabled and only download to file is allowed. Also, only SM04, STAD and ST03N are available for testing at this stage. The other metrics like SM20, SM21 and the RFC extractor will be published in the next BETA drop, but I just wanted to get the work in progress out there as a few people have contacted me about STAD data. Look in the downloads tab to find some screen video showing the installation and setup process.

Just on version 3:

The entire application has been re-coded as a class-based application with a standard framework for you to develop your own metrics. You copy a template class and create some simple data structures (reference SAP standard ones in most cases).
The software is delivered by SAP Nuggets, which allows you to implement the coding much more quickly, but still not as fast or convenient as a transport.
The data will be able to be retrieved by function call as previously, but it can also write it to file in SPLUNK format, CSV, XML and any other format you can code as a rule. I ship an example where it populates a file with INSERT INTO (...) VALUES(...); statements that you can execute to update your own 3rd party database if you like. It can output multiple files of different format type from a single collection, without having to re-gather the statistics each time.
The purging routines are much more database friendly, with small commit sizes.
The collection granularity will be much finer, down to 1 second collections for point-in-time data like SM04 and down to 15 seconds for range data like ST03N.
You no longer have to schedule background jobs, though you can still schedule manually if you want to. The scheduler will do it all for you. Point-in-time data will be collected in dialog mode, while range data will be submitted as background jobs. You will have control about how many jobs may run concurrently and on which servers. The controlling program for dialog mode collection is well-behaved and will roll-out of the work process while waiting for the next execution.
If you use Twitter, any updates will be tweeted from sapninja
... STAY WITH ME, I am working hard but there are some pretty cool things in the pipeline. From what SAP has been saying about Solution Manager 7.1, I started to feel that this application is obsolete but, after battling for months with ST-PI, ST-A/PI versions, Wily agents, etc. etc., this little collector definitely has a place in the sun. Wait until version 3.1 when I will allow you to rip out the data from the BI cubes in solution manager and use it in the way you want.

July 26, 2012 - I have created a shared document using an awesome product called Lucid Charts. This gives a holistic view of ABAP system performance and how to troubleshoot problems. Check out this PDF document. http://www.lucidchart.com/publicSegments/view/50107843-3398-4bcb-bc58-21ff0a56c7b2/image.pdf

Stable Version
Version 1.03 is available for download. If you have already implemented previous versions, please follow the delta upgrade guides from the Downloads page to adopt the new changes.

To implement the data gathering, get a copy of the installation manual and follow the Installation Manual. Once you have done this, start understanding the information that you have gathered and how you might use it from the Dataset Guide.

How it works
Download the installation guide at the link above. The guide contains links to source code in this site, which is all under version control. Follow the instructions in the guide to deploy the code and set up your data collection and extraction.

This code has been tested and works with SAP_BASIS 7.00, 7.01, 7.02 and 7.20. I would be keen to work with anyone having problems on a different version. I have already started to prepare branch points for different version levels of components. I do not propose having different releases for different versions, I prefer the one set of code to handle multiple different versions of SAP Netweaver.

Use this framework to extract ST03N, SM20, SM21, RZ20 (CCMS), SM50, SM04 and SP01 data from SAP.

All the code and instructions on how to deploy it has been released. Grab a copy of the installation guide and get into it ... and point out any mistakes to me please. Any questions, issues or suggestions for new functionality can be raised in the Issues Page. 

You should not feel intimidated if you do not have access to an ABAPer. The instructions have been written in such a way that most reasonably competent SAP consultants should be able to accomplish, with some possible learnings on the way.

Also

I await feedback and suggestions from you and hopefully grow a community of people
For people interested in getting started with Splunk, it's free for a small amount of ingested data, certainly the free threshold will give you enough to monitor a SAP system completely. Check out http://www.splunk.com and a good quick tutorial is http://www.innovato.com/splunk/GettingStarted.htm.
If you set things up and have Splunk slurping logs in, then visit http://splunk-base.splunk.com/apps/33197/splunk-for-sap and install it to get the free community views and visualization that you can use immediately
Background
This site has been created to provide code and tools that SAP Administrators can use and contribute to. SAP licensing restrictions mean that any code developed on their "Mini SAP" or "IDES" demonstration systems automatically becomes the property of SAP. They also make it prohibitively difficult and expensive for individuals to purchase an ABAP development license. This makes it tough for people who wish to develop and share tools with the general community, and ensure they remain in the public domain.

To ensure that this code remains freely available, it is provided as source code under a GPL3 license. To use the suggested code, you will need to have a valid SAP development license and you will need to implement this code and transport it from your local development system. Until such time as SAP gives the community the opportunity to develop open-source code, none of the code here will be available as SAP transports.

The inspiration behind this code project is to provide extraction tools for Splunk software and desire to improve monitoring tools for SAP. Incredibly powerful monitoring information can be obtained from the the raw data that is extracted if it is passed on to a tool like Splunk. The extraction of this data is not limited to Splunk and may in fact be ported to any external analytical system (spreadsheets, databases, etc.)

Much of the code is, in fact, wrapper-code that simply calls existing SAP function modules and kernel functions. Care is taken to acknowledge proprietary SAP functions with comments in our own code. If we have been remiss in acknowledging SAP source, please notify us and we will include the acknowledgement. It is not our intention to plagiarise SAP code for profit.


# sapninja
Automatically exported from code.google.com/p/sapninja
