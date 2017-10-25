package com.sod.utils;

import com.sod.pojo.User;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;
import java.util.UUID;

/**
 * 邮箱验证
 */
public class MailUtil {
    public   static final String FROM = "wkz374971453@163.com";//发件人地址
    public   static final String PWD = "wkz374971453";//授权码

    public static void activateMail(User user){
        String to = user.getEamil(); //收件人地址

        String URL = "http://localhost:8090";//项目主页
        int TIMELIMIT = 1000*60*60; //激活邮件过期时间1小时
        int PORT = 25;
        String TITLE = "Snailgirl账户激活邮件"; //邮件标题
        String HOST = "smtp.163.com";
        String SMTP = "smtp";
        //当前时间戳
        Long curTime = System.currentTimeMillis();
        //激活的有效时间
        Long activateTime = curTime+TIMELIMIT;
        //激活码--用于激活邮箱账号
        String userId = user.getUserId();
        String content = "<p>您好 O(∩_∩)O~~<br><br>欢迎使用Snailgirl!<br><br>帐户需要激活才能使用，赶紧激活成为Snailgirl正式的一员吧:)<br><br>请在1小时内点击下面的链接立即激活帐户："
                +"<br><a href='"+URL+"/user/activatEmail?userId="+userId+"&email="+to+"'>"
                +URL+"/user/activatEmail?userId="+userId+"&email="+to+"</a></p>";
        Properties props = new Properties(); //可以加载一个配置文件
        props.put("mail.smtp.host", HOST);//存储发送邮件服务器的信息
        props.put("mail.store.protocol",SMTP);//设置协议
        props.put("mail.smtp.prot",PORT);//设置端口
        props.put("mail.smtp.auth", "true");//同时通过验证
        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM,PWD);
            }
        };
        Session session = Session.getDefaultInstance(props,authenticator);
        Message msg = new MimeMessage(session);
        try {
            msg.setFrom(new InternetAddress(FROM));
            InternetAddress[] addresses = {new InternetAddress(to)};
            msg.setRecipients(Message.RecipientType.TO,addresses);
            msg.setSubject(TITLE);//设置邮件标题
            msg.setSentDate(new Date());//邮件发送时间
            msg.setContent(content,"text/html;charset=utf-8");
            //发送邮件
            Transport.send(msg);
        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }

    public static void ForgetPassword(User user){
        String to = user.getEamil(); //收件人地址

        String URL = "http://localhost:8090";//项目主页
        int TIMELIMIT = 1000*60*60; //激活邮件过期时间1小时
        int PORT = 25;
        String TITLE = "Snailgirl账户激活邮件"; //邮件标题
        String HOST = "smtp.163.com";
        String SMTP = "smtp";
        //当前时间戳
        Long curTime = System.currentTimeMillis();
        //激活的有效时间
        Long activateTime = curTime+TIMELIMIT;
        //激活码--用于激活邮箱账号
        String userId = user.getUserId();
        String content = "<p>您好 O(∩_∩)O~~<br><br>欢迎使用Snailgirl!<br><br>请在1小时内点击下面的链接修改您的密码："
                +"<br><a href='"+URL+"/user/toUpdatePassword?userId="+userId+"&email="+to+"'>"
                +URL+"/user/toUpdatePassword?userId="+userId+"&email="+to+"</a></p>";
        Properties props = new Properties(); //可以加载一个配置文件
        props.put("mail.smtp.host", HOST);//存储发送邮件服务器的信息
        props.put("mail.store.protocol",SMTP);//设置协议
        props.put("mail.smtp.prot",PORT);//设置端口
        props.put("mail.smtp.auth", "true");//同时通过验证
        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM,PWD);
            }
        };
        Session session = Session.getDefaultInstance(props,authenticator);
        Message msg = new MimeMessage(session);
        try {
            msg.setFrom(new InternetAddress(FROM));
            InternetAddress[] addresses = {new InternetAddress(to)};
            msg.setRecipients(Message.RecipientType.TO,addresses);
            msg.setSubject(TITLE);//设置邮件标题
            msg.setSentDate(new Date());//邮件发送时间
            msg.setContent(content,"text/html;charset=utf-8");
            //发送邮件
            Transport.send(msg);
        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }
}
