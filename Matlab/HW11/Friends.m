% Script to create an array of structures to store info of my friends.
% Friends.m
% It uses the constructor MyFriendC, which create a single struct
% for just one friend.
% MyFriendC in turn calls another constructor emailAddressC which
% creates a single struct for an email address.
% K. Ming Leung, 2018.04.24

clear; clc; format short;

nFriends = 10;   % number of friends to create in the structure array

MyFriends(nFriends) = MyFriendC('Zach',datenum(1997,3,26),'zsl147','nyu.edu');
MyFriends(1) = MyFriendC('Ali',datenum(1999,1,11),'aliMuhammad','hotmail.com');
MyFriends(2) = MyFriendC('Bea',datenum(1999,2,23),'ba4321','nyu.edu');
MyFriends(3) = MyFriendC('Cai',datenum(2002,3,4),'CaiRuChen','columbia.edu');
MyFriends(4) = MyFriendC('Dan',datenum(2000,4,2),'Dan-Katz','arl.army.mil');
MyFriends(5) = MyFriendC('Eve',datenum(1995,5,6),'Eve.Henderson','nyu.edu');
MyFriends(6) = MyFriendC('Faye',datenum(2000,6,30),'FayeDunaway','gmail.com');
MyFriends(7) = MyFriendC('Gabriel',datenum(1996,2,19),'gk888','nyu.edu');
MyFriends(8) = MyFriendC('Hope',datenum(1999,2,19),'hk311','nyu.edu');
MyFriends(9) = MyFriendC('Ian',datenum(1988,4,26),'isl147','nyu.edu');

save('C:\Users\User\Documents\MATLAB\work\teach\cs1133\s18\Part3\Friends.mat','MyFriends');
