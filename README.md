# DaemonLeash for OS X

We have been using Adobe Creative Cloud (for Mac OSX) for quite a while now and it came to our attention that several background processes connect to Adobe Servers to send out data as soon as we start our Computer (even though we did not start any Adobe Application). Google Software does behave in exactly the same way. These processes require processing power that we want to use in other ways. Yes, background processes check for updates too - yet we prefer to check for updates manually.

But most importantly we do value our privacy. The average user does not exactly know what data is being collected, even though Adobe claims only to collect data to improve its products. Yet we think it already is intolerable that Adobe and Google automatically know when, where and for how long we use our computers. We want to limit the collection of our data as much as we can. This means we also want to control the apps we have installed on our system. Furthermore we want to make it easy for inexperienced users to implement scripts and Launch Daemons that help them to keep such data collection practices at bay.

This is why we developed DaemonLeash.

Whenever you start your computer DaemonLeash checks for Adobe and Google Launch Daemons and disables them before they can connect to the internet. It also keeps listening in the background while you are using your favorite Adobe Application and terminates any persitent Adobe Backgound Process as soon as you finish using it. DaemonLeash consists of a Launch Daemon, a Launch Agent, four Shell Scripts and a Log File.



### INSTALLATION

We have written an Install_DaemonLeash.sh that will set up DaemonLeash for you. Simply drag and drop the installation script into a terminal window, type your password and the script will run all necessary commands for you. You can view the whole installation process in your terminal window. 
If you don't want to use DaemonLeash anymore, simply run Remove_DaemonLeash.sh.



### ADOBE PRIVACY POLICY

You can find Adobe's full Privacy Policy here:

	-> https://www.adobe.com/privacy/policy.html#rights
	-> https://www.adobe.com/privacy/policies.html
	-> https://www.adobe.com/privacy/cookies.html
	-> https://www.adobe.com/privacy/general-data-protection-regulation.html
  

QUOTE:

"Under the law of some countries, you may have the right to ask us for a copy of your personal information; to correct, delete or restrict (stop any active) processing of your personal information; and to obtain the personal information you provide to us for a contract or with your consent in a structured, machine readable format, and to ask us to share (port) this information to another controller.
In addition, you can object to the processing of your personal information in some circumstances (in particular, where we don’t have to process the information to meet a contractual or other legal requirement, or where we are using the information for direct marketing).
These rights may be limited, for example, if fulfilling your request would reveal personal information about another person, or if you ask us to delete information which we are required by law to keep or have compelling legitimate interests in keeping (such as fraud prevention purposes).
To exercise any of these rights (including deactivating your Adobe ID account), you can get in touch with us – or our data protection officer – using the details set out below.
If you have unresolved concerns, you have the right to report them to an EU or other data protection authority where you live, work or where you believe a potential violation may have occurred."


You can request a copy of your data here:

	-> privacy inquiry form: https://www.adobe.com/privacy/privacy-contact.html
	-> email: DPO@adobe.com


### Note

Both Adobe and Google automatically install Plugins and Startup Items on your Computer. You can disable them at any time:

Open your System Preferences, select Users & Groups and your Admin Account, then click the small lock in the bottom left corner and type in your password. Select Login Items and remove all apps that you don't want to start whenever you log in (select the app and click -). We recommend you disable Creative Cloud on startup and only start it when you need to update your Adobe Applications.

Next, go back to System Preferences, click on Extensions and remove all hooks under any Plugin you want to disable. 

If you further want to monitor, maybe even block outgoing connections of active apps, that send data from your computer to their developers while you are using them, we recommend you purchase Little Snitch. Little Snitch is a host-based application firewall for macOS. It can be used to monitor apps, preventing or permitting them to connect to attached networks through advanced rules. A Single License costs about \$45/45€/£45.

    ->  https://www.obdev.at/index.html


### MIT License

Copyright (c) 2019

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
