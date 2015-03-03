-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 04, 2015 at 12:43 AM
-- Server version: 5.6.21
-- PHP Version: 5.5.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_portal_similiar`
--

-- --------------------------------------------------------

--
-- Table structure for table `similiar_account`
--

CREATE TABLE IF NOT EXISTS `similiar_account` (
`id` int(5) unsigned NOT NULL,
  `name` varchar(40) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `password_origin` varchar(50) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `similiar_account`
--

INSERT INTO `similiar_account` (`id`, `name`, `username`, `password`, `password_origin`) VALUES
(1, 'nanang', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(2, 'similiar', 'password', '5f4dcc3b5aa765d61d8327deb882cf99', 'password');

-- --------------------------------------------------------

--
-- Table structure for table `similiar_cat_menu`
--

CREATE TABLE IF NOT EXISTS `similiar_cat_menu` (
`id` int(5) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `year` varchar(5) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `similiar_cat_menu`
--

INSERT INTO `similiar_cat_menu` (`id`, `name`, `date`, `year`) VALUES
(1, 'progamming', '2015-02-25', '2015'),
(2, 'internet', '2015-02-24', '2015'),
(3, 'kriminal', '2014-02-17', '2014'),
(4, 'berita pajak', '2015-02-27', '2015');

-- --------------------------------------------------------

--
-- Table structure for table `similiar_contens`
--

CREATE TABLE IF NOT EXISTS `similiar_contens` (
`id` int(11) unsigned NOT NULL,
  `menu_id` int(11) NOT NULL,
  `cat_menu_id` int(11) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `date_input` date NOT NULL,
  `author` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `contens` text NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `similiar_contens`
--

INSERT INTO `similiar_contens` (`id`, `menu_id`, `cat_menu_id`, `judul`, `date_input`, `author`, `image`, `contens`) VALUES
(2, 2, 1, 'Berita Pajak', '2015-02-27', 'nanang', '20130101_0801262.jpg', '<p><img alt="" src="http://localhost/CI/portal_similiar/assets/uploads/images/1421675241443.jpg" style="height:54px; width:90px" /></p>\r\n\r\n<p>[sourcecode languange=&quot;php&quot;]</p>\r\n\r\n<p>&lt;?php if ( ! defined(&#39;BASEPATH&#39;)) exit(&#39;No direct script access allowed&#39;);</p>\r\n\r\n<p>class Model_news extends CI_Model {</p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp;<br />\r\n&nbsp;&nbsp; &nbsp;public function get()<br />\r\n&nbsp;&nbsp; &nbsp;{<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$query = $this-&gt;db-&gt;select(&#39;*&#39;)-&gt;from(&#39;similiar_menu&#39;)-&gt;get();</p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;return $query;<br />\r\n&nbsp;&nbsp; &nbsp;}</p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp;public function get_cat()<br />\r\n&nbsp;&nbsp; &nbsp;{<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$query = $this-&gt;db-&gt;select(&#39;*&#39;)-&gt;from(&#39;similiar_cat_menu&#39;)-&gt;get();</p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;return $query;&nbsp;&nbsp; &nbsp;<br />\r\n&nbsp;&nbsp; &nbsp;}</p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp;public function get_contens()<br />\r\n&nbsp;&nbsp; &nbsp;{<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$query = $this-&gt;db-&gt;select(&#39;*&#39;)-&gt;from(&#39;similiar_contens&#39;)-&gt;get();</p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;return $query;&nbsp;&nbsp; &nbsp;<br />\r\n&nbsp;&nbsp; &nbsp;}<br />\r\n&nbsp;&nbsp; &nbsp;<br />\r\n&nbsp;&nbsp; &nbsp;public function get_main($id)<br />\r\n&nbsp;&nbsp; &nbsp;{<br />\r\n&nbsp;&nbsp; &nbsp;$this-&gt;db-&gt;select(&#39;*&#39;)<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; -&gt;from(&#39;similiar_contens a&#39;)<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; -&gt;join(&#39;similiar_cat_menu b&#39;,&#39;a.cat_menu_id = b.id &#39;);<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;if($this-&gt;uri-&gt;segment(2)==&quot;store_category&quot;)<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;{<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$this-&gt;db-&gt;where(&#39;a.cat_menu_id&#39;,$id);<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;}else{<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$this-&gt;db-&gt;where(&#39;a.menu_id&#39;,$id);<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;}<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<br />\r\n&nbsp;&nbsp; &nbsp;$query = $this-&gt;db-&gt;get();<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<br />\r\n&nbsp;&nbsp; &nbsp;return $query;<br />\r\n&nbsp;&nbsp; &nbsp;}</p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp;function do_insert_menu()<br />\r\n&nbsp;&nbsp; &nbsp;{<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$name&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;= $this-&gt;input-&gt;post(&#39;name&#39;);<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;//$name &nbsp; &nbsp;= $this-&gt;input-&gt;post(&#39;url&#39;);<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$parent_id &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;= $this-&gt;input-&gt;post(&#39;parent_id&#39;);<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$tes = &quot;pindah ke table url_menu&quot;;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$data = array(<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&#39;name&#39;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; =&gt;&nbsp;&nbsp; &nbsp;$name,<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&#39;url&#39;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; =&gt;&nbsp;&nbsp; &nbsp;$tes,<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&#39;parent_id&#39;&nbsp;&nbsp; &nbsp; =&gt;&nbsp;&nbsp; &nbsp;$parent_id,<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;);</p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$this-&gt;db-&gt;insert(&#39;similiar_menu&#39;,$data);<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$id = $this-&gt;db-&gt;insert_id();</p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$url = &#39;news/view/&#39;.$name.&#39;/&#39;.$id;</p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$res = array(<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&#39;menu_id&#39; =&gt; $id,<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&#39;url&#39; &nbsp; &nbsp; =&gt; $url<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;);<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$this-&gt;db-&gt;insert(&#39;similiar_url_menu&#39;,$res);<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<br />\r\n&nbsp;&nbsp; &nbsp;}<br />\r\n&nbsp;&nbsp; &nbsp;<br />\r\n&nbsp;&nbsp; &nbsp;function do_insert_category()<br />\r\n&nbsp;&nbsp; &nbsp;{<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$name&nbsp;&nbsp; &nbsp;= $this-&gt;input-&gt;post(&#39;name&#39;);<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$data = array(<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&#39;name&#39;&nbsp;&nbsp; &nbsp;=&gt;&nbsp;&nbsp; &nbsp;$name,<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&#39;date&#39;&nbsp;&nbsp; &nbsp;=&gt;&nbsp;&nbsp; &nbsp;date(&#39;Y-m-d&#39;),<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&#39;year&#39;&nbsp;&nbsp; &nbsp;=&gt;&nbsp;&nbsp; &nbsp;date(&#39;Y&#39;),<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;);</p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$this-&gt;db-&gt;insert(&#39;similiar_cat_menu&#39;,$data);<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$id = $this-&gt;db-&gt;insert_id();&nbsp;&nbsp; &nbsp;<br />\r\n&nbsp;&nbsp; &nbsp;}</p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp;function do_insert_contens()<br />\r\n&nbsp;&nbsp; &nbsp;{<br />\r\n&nbsp;&nbsp; &nbsp;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$namafile = $this-&gt;upload_file();<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;//echo $namafile;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;//exit();&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$menu_id&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;= $this-&gt;input-&gt;post(&#39;menu_id&#39;);<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$cat_menu_id &nbsp; &nbsp;= $this-&gt;input-&gt;post(&#39;cat_menu_id&#39;);<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$judul &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;= $this-&gt;input-&gt;post(&#39;judul&#39;);<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$author &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;= $this-&gt;input-&gt;post(&#39;author&#39;);<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$contens &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;= $this-&gt;input-&gt;post(&#39;contens&#39;);<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;</p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$data = array(<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&#39;menu_id&#39;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; =&gt;&nbsp;&nbsp; &nbsp;$menu_id,<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&#39;cat_menu_id&#39;&nbsp;&nbsp; &nbsp; =&gt;&nbsp;&nbsp; &nbsp;$cat_menu_id,<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&#39;judul&#39;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; =&gt;&nbsp;&nbsp; &nbsp;$namafile,<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&#39;date_input&#39; &nbsp;&nbsp; &nbsp; =&gt;&nbsp;&nbsp; &nbsp;date(&#39;Y-m-d&#39;),<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&#39;author&#39; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; =&gt;&nbsp;&nbsp; &nbsp;$author,<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&#39;image&#39;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; =&gt;&nbsp;&nbsp; &nbsp;$namafile,<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&#39;contens&#39;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; =&gt;&nbsp;&nbsp; &nbsp;$contens<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;);</p>\r\n\r\n<p><br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$this-&gt;db-&gt;insert(&#39;similiar_contens&#39;,$data);<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$id = $this-&gt;db-&gt;insert_id();<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<br />\r\n&nbsp;&nbsp; &nbsp;}<br />\r\n&nbsp;&nbsp; &nbsp;<br />\r\n&nbsp;&nbsp; &nbsp;function upload_file()<br />\r\n&nbsp;&nbsp; &nbsp;{</p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$namafile = &#39;&#39;;&nbsp;&nbsp; &nbsp;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;if($_FILES)<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;{<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;//Jika kondisi ada file<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;//Upload file<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$config[&#39;upload_path&#39;] = &#39;./assets/uploads/images/&#39;;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$config[&#39;allowed_types&#39;] = &#39;jpeg|png|jpg&#39;;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$this-&gt;load-&gt;library(&#39;upload&#39;,$config);</p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;if (!$this-&gt;upload-&gt;do_upload())<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;{<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$error = array(&#39;error&#39; =&gt; $this-&gt;upload-&gt;display_errors());<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo&quot;&lt;pre&gt;&quot;;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; print_r($error);<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; exit();<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo&quot;&lt;/pre&quot;;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;}else{</p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$datafile=$this-&gt;upload-&gt;data();<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;$namafile = $datafile[&#39;file_name&#39;];<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;} //end of if upload<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;}//end of if $_files</p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;return $namafile;<br />\r\n&nbsp;&nbsp; &nbsp;}//function end</p>\r\n\r\n<p>}</p>\r\n\r\n<p>/* End of file welcome.php */<br />\r\n/* Location: ./application/controllers/welcome.php */</p>\r\n\r\n<p>[/sourcecode]</p>\r\n'),
(3, 2, 2, 'hello word', '2015-02-27', 'nanang', '20130101_080133.jpg', '<h1>Hello, world!</h1>\r\n\r\n<p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content&nbsp;</p>\r\n'),
(4, 4, 3, 'operasi 86 NET', '2015-03-04', 'nanang', 'iseng_aja.png', '<p style="text-align:justify"><span style="background-color:rgb(246, 247, 248); color:rgb(20, 24, 35); font-family:helvetica,arial,lucida grande,tahoma,verdana,arial,sans-serif; font-size:12px">jadi gini loh gan, saya lagi buat aplikasi pemilihan ketua bem &#39;misal&#39;. nah saat user login dia akan memilih, nah pada saat user itu memilih dan menekan submit saya mau merubah status si user yg sedang memilih itu menjadi sudah &#39;misal&#39;.<br />\r\nbiar saat user tersebut kembali login maka tidak bisa memilih karena status si user tersebut sudah..&nbsp;</span><br />\r\n<br />\r\n<span style="background-color:rgb(246, 247, 248); color:rgb(20, 24, 35); font-family:helvetica,arial,lucida grande,tahoma,verdana,arial,sans-serif; font-size:12px">gan&nbsp;&nbsp;lom beres ni gan .</span></p>\r\n'),
(5, 3, 2, 'dasar android', '2015-03-04', 'similiar', 'iseng_aja1.png', '<p><span style="background-color:rgb(246, 247, 248); color:rgb(20, 24, 35); font-family:helvetica,arial,lucida grande,tahoma,verdana,arial,sans-serif; font-size:12px">jadi gini loh gan, saya lagi buat aplikasi pemilihan ketua bem &#39;misal&#39;. nah saat user login dia akan memilih, nah pada saat user itu memilih dan menekan submit saya mau merubah status si user yg sedang memilih itu menjadi sudah &#39;misal&#39;.<br />\r\nbiar saat user tersebut kembali login maka tidak bisa memilih karena status si user tersebut sudah..&nbsp;</span><br />\r\n<br />\r\n<span style="background-color:rgb(246, 247, 248); color:rgb(20, 24, 35); font-family:helvetica,arial,lucida grande,tahoma,verdana,arial,sans-serif; font-size:12px">gan jay&nbsp;lom beres ni gan .</span></p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `similiar_menu`
--

CREATE TABLE IF NOT EXISTS `similiar_menu` (
`id` int(5) unsigned NOT NULL,
  `name` varchar(25) NOT NULL,
  `url` varchar(100) NOT NULL,
  `parent_id` int(5) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `similiar_menu`
--

INSERT INTO `similiar_menu` (`id`, `name`, `url`, `parent_id`) VALUES
(2, 'php', 'news/view/php/2', 0),
(3, 'android', 'news/view/android/3', 0),
(4, 'headline news', 'news/view/headline new/4', 0);

-- --------------------------------------------------------

--
-- Table structure for table `similiar_url_menu`
--

CREATE TABLE IF NOT EXISTS `similiar_url_menu` (
`id` int(10) unsigned NOT NULL,
  `url` varchar(40) NOT NULL,
  `menu_id` int(5) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `similiar_url_menu`
--

INSERT INTO `similiar_url_menu` (`id`, `url`, `menu_id`) VALUES
(3, 'news/view/php/2', 2),
(4, 'news/view/android/3', 3),
(5, 'news/view/headline new/4', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `similiar_account`
--
ALTER TABLE `similiar_account`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `similiar_cat_menu`
--
ALTER TABLE `similiar_cat_menu`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `similiar_contens`
--
ALTER TABLE `similiar_contens`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `similiar_menu`
--
ALTER TABLE `similiar_menu`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `similiar_url_menu`
--
ALTER TABLE `similiar_url_menu`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `similiar_account`
--
ALTER TABLE `similiar_account`
MODIFY `id` int(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `similiar_cat_menu`
--
ALTER TABLE `similiar_cat_menu`
MODIFY `id` int(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `similiar_contens`
--
ALTER TABLE `similiar_contens`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `similiar_menu`
--
ALTER TABLE `similiar_menu`
MODIFY `id` int(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `similiar_url_menu`
--
ALTER TABLE `similiar_url_menu`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
