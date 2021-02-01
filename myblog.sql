DROP DATABASE IF EXISTS myblog;

CREATE DATABASE myblog CHARACTER SET utf8mb4;
USE myblog;
CREATE TABLE blog(
	id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(50) NOT NULL,
	create_time DATE,
	category VARCHAR(50) NOT NULL,
	view_number INT,
	comment_number INT,
	content TEXT NOT NULL,
	img VARCHAR(50),
	TYPE INT,
	descr VARCHAR(100)
	);

CREATE TABLE category(
	id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(50)
	);
	
CREATE TABLE COMMENT(
	id INT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(50),
	content TEXT,
	b_id INT NOT NULL,
	is_response INT
	);

CREATE TABLE info(
	id INT PRIMARY KEY AUTO_INCREMENT,
	article_num INT,
	access_num INT,
	comment_num INT,
	hot_num INT);
	
INSERT INTO category VALUES(1,'test_category');
INSERT INTO category VALUES(2,"JAVA");
INSERT INTO category VALUES(3,"C++");
INSERT INTO category VALUES(4,"C");
INSERT INTO category VALUES(5,"Python");
INSERT INTO category VALUES(6,"HTML");
INSERT INTO info VALUES(1,0,0,0,0);
INSERT INTO blog VALUES(1,"kmcsb",'2020-01-10',"test_category",10,0,"this is a test_content","../static/images/backimg0.jpg",1,"this is a text_desc");
INSERT INTO blog VALUES(2,"kmcsb2",'2020-01-11',"test_category",11,0,"this is a test_content2","../static/images/backimg1.jpg",2,"this is a text_desc2");
INSERT INTO blog VALUES(3,"kmcsb3",'2020-01-13',"test_category",12,0,"this is a test_content3","../static/images/backimg0.jpg",3,"this is a text_desc3");
INSERT INTO blog VALUES(4,"巴什博弈","2020-01-14","test_category",13,0,"巴什博弈
有一堆数量为n的石子，每个人每次可以取1~m颗石子，最先取完的一方胜利。

结论
若n%(m+1）==0则先手必败，反之先手必胜。

（以下所有均以双方足够明智作为前提）
巴什博弈为博弈论中最基础的部分，据此可以推算出博弈论中的通用方法：
对于每个点，可以分为两种属性，分别为：
P点： 状态处于该点时将要进行操作的玩家必定失败；
N点： 状态处于该点时将要进行操作的玩家必定成功。
存在三个定理：
1. 所有终结点都是必败点P（上游戏中，轮到谁拿牌，还剩0张牌的时候，此人就输了，因为无牌可取）；
2. 所有一步能走到P点的点均为N点；
3. 不管怎样操作只能到达N点的点为P点。","../static/images/backimg3.jpg",1,"巴什博弈的简介");

INSERT INTO blog VALUES(5,"斐波拉契博弈","2020-01-15","test_category",14,0,"斐波拉契博弈：

有一堆个数为n的石子，游戏双方轮流取石子，同时有一下规则：
1.先手不能直接把石子全部取完；
2.除了第一次，之后每次取石子的数目只能在1到上次取石子数的两倍之间（包括边界）。
无石子可取即为失败。

结论：若初始时石子数为斐波拉契数则先手为必败态，反之先手必胜。

证明：主要可以看博客https://blog.csdn.net/ACM_cxlove/article/details/7835016。","../static/images/backimg0.jpg",2,"斐波拉契博弈的简介");

INSERT INTO blog VALUES(6,"威佐夫博弈","2020-01-16","test_category",15,0,"威佐夫博弈主要内容：
有两堆石子，两个人轮流从任一堆或同时从两堆中取同样多的石子，规定每次至少取一个，最后取光者获胜。
主要思路：
将两堆物品中较少的一堆数量记作a，另一个记作b。
存在必败态（奇异点）：（0，0）、（1，2）、（3，5）、（4，7）、（6，10）、（8，13）、（9，15）、（11，18）、（12，20）…
存在固定公式a ==（b-a）（sqrt（5.0+1）/2.0）时先手为必败态（奇异点）。
具体代码：

	int aa,bb;
	cin>>aa>>bb
	int a = min(aa,bb);
	int b = max(aa,bb);
	if(a==0) cout<<1<<endl;
	else if(a == (int)((double)(b-a)*(sqrt(5.0)+1.0)/2.0)) cout<<0<<endl;
	else cout<<1<<endl;","../static/images/backimg0.jpg",3,"威佐夫博弈的简介");
	
INSERT INTO category VALUE(1,"test_category",6);
SELECT * FROM category;
SELECT * FROM blog;