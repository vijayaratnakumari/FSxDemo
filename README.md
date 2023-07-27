# FSxDemo.
How to Create an FSx Windows file server and connect to the Windows remote desktop server?

Step-by-step process. 

# AWS WorkSpaces and FSx File Server. 

WorkSpaces: 

Search in Google: “AWS workspaces AD connector.”
Select “Lunch a workSpace using AD connector- AWS workSpace” —--> Page opened. 
Launch a workspace using an AD connector.

# AWS console page: 
WorkSpaces:
Under End user computing —-> WorkSpaces. WorkSpaces also look like an EC2 server.
Click on WokSpaces—-> Get started—---> Launch workSpaces using Advanced options—-> Including using your on-premises directory and existing (Amazon VPC).
 
Amazon FSx:
Under storage —-> FSx 
FSx is also one of the storage services and this also looks like an EFS but EFS is not supported for Windows.
Create file system: we have 4 types of file systems in the Amazon FSx.
1. Amazon FSx for NetApp ONTAP
2. Amazon FSx for OpenZFS
3. Amazon FSx for Windows File Server.
   
4.Amazon FSx for Lustre (Linux)


# Note: We have to need Directory Service While creating FSx and WorkSpaces also. 

* What are AWS workSpaces and Pre-req for WorkSpaces?
We need an Active Directory to create users.
We need to have a VPC with Multiple subnets.
WorkSpaces Means: newly joined some employers in the company at that time, they have one Laptop but we need security for our company work so by using these workSpaces. 
BYOD: Bring your own Device.
VMware: VDI-Virtual Desktop Infrastructure.
Citrix: Xen Desktop.
Desktop as a Service (DaaS)

Creating a new VPC, Subnets, IGW, Routing table, and Security Groups.
Setting up a Windows server and connecting Microsoft AD. 
Understanding Directory service in the AWS.
Installing an AD connection with the Active Directory.
Create a workSpaces user and allocate a desktop.

What is an FSx File System?
Create an FSx file System and Mount it to workSpace Access the share folders and create the file, delete the lab.

Demo: Using Amazon FSx for Windows File Server.

# Create EC2 instance for Windows 2019 Base server (free trial).
Attached are VPC, subnets, and Security groups.
Note: Make sure you installed this in the Public subnets, and Security groups inbound rules added port no:3389 RDP anywhere, Key Pair is mainly important, attached to VPC to multiple subnets private and public subnets. 

After successfully Launching AWS Microsoft windows server 2019 Base.

Next, we need to Set up Directory Services with AWS Managed Microsoft AD in the AWS console.

Connect to Remote Desktop connection and Microsoft Windows Instance by using Key Pair. 

We have two ways to connect to a remote desktop.
Select the instance and click on CONNECT—-----> Click RDP client.
1. Download the remote desktop file (RDP).
2. EC2 Instance Public IP Address and Username: Administrator.
 The remaining process is the same. 
after downloading double click. Open one window asked the Password. By using Key pair we can get the password and enter it and booting it happens then open Microsoft Windows server desktop. 

Open CMD (command prompt)
# Run this command:  %SystemRoot%\system32\control.exe ncpa.cpl

Setup Ethernet —-> Internet protocol Version4 (IPV4)
Check your directory IP address matched with DNS server IP.
Next.

# Run this command: %SystemRoot%\system32\control.exe sysdm.cpl

Check System properties. Provide Domain Name, Domain username, and password details. 
After completing this process it’s asking to Restart the now or later alert box. Restarting now is good.

![Screenshot 2023-07-27 142121](https://github.com/vijayaratnakumari/FSxDemo/assets/78976740/b116ed3a-25c4-43df-90f0-8bce68e77a1e)
![Screenshot 2023-07-27 142244](https://github.com/vijayaratnakumari/FSxDemo/assets/78976740/80592b7f-9a84-4a2b-8936-772429b2d21f)


Now we need to Create Amazon FSx:
# Note: 
We have to need the same VPC, default Security Groups, Two Private Subnets, and Directory services (Windows authentication (AWS Managed Microsoft Active Directory)). 
By using these all we can create an Amazon FSx Windows File server.

File System is available then copy the DNS name and paste it into (Windows Remote Desktop) Windows File Explorer. We have a Share folder in the aws Server by default. 
Goto start—-> search fsmgmt.msc—---> enter
Open the shared folder window. Right Click on the shared folder(local) —----> select connect to another computer —----> paste the DNS name. Now we have to access aws server to share folders, and files in the Windows remote desktop.

![1690389210044](https://github.com/vijayaratnakumari/FSxDemo/assets/78976740/27f11cdb-b58b-446c-b72c-c7bf7fd37ee9)
![1690389210030](https://github.com/vijayaratnakumari/FSxDemo/assets/78976740/ff3f04fd-1757-4f7c-a67e-1462d5ce59cd)
