# DaemonLeash for OS X

We have been using Adobe Creative Cloud (for Mac OSX) for quite a while now and it came to our attention that several background processes connect to Adobe Servers to send out data as soon as we start our Computer (even though we did not start any Adobe Application). Google Software does exactly the same thing. These processes do require a certain amount processing power that we want to use in other ways.

But most importantly we do value our privacy. The average user does not exactly know what data is being collected, even though Adobe claims only to collect data to improve its products. Yet we think it already is intolerable that Adobe and Google can use these processes to determine when, where and for how long we use our computers. We want to limit the collection of our data as much as we can. And we want to make it easy for inexperienced users to implement scripts and Launch Daemons that help them to keep such data collection practices at bay.

This is why we developed DaemonLeash.

Whenever you start your computer DaemonLeash checks for Adobe and Google Launch Daemons and disables them before they can connect to the internet. It also keeps listening in the background while you are using your favorite Adobe Application and terminates any persitent Adobe Backgound Process as soon as you finish using it. DaemonLeash consists of a Launch Daemon, a Launch Agent, four Shell Scripts and a Log File.



## INSTALLATION

We have written Install_DaemonLeash.sh that will set up DaemonLeash for you. Simply drag and drop the installation script into a terminal window, type your password and the script will run all necessary commands for you. You can view the whole installation process in your terminal window. 
If you don't want to use DaemonLeash anymore, simply run Remove_DaemonLeash.sh.



## MIT License

Copyright (c) 2019

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
