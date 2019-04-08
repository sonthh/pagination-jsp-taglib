package com.itsontran.service;

import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;

@Service
public class JavaMailService {

	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	VelocityEngine velocityEngine;

	public void sendMail(String to, String subject) {
		MimeMessage mimeMessage = mailSender.createMimeMessage();
		try {
			MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);

			mimeMessageHelper.setSubject(subject);
			mimeMessageHelper.setTo(to);

			Map<String, Object> model = new HashMap<String, Object>();
			model.put("name", "Sơn");
			model.put("age", "18");
			mimeMessageHelper.setText(geContentFromTemplate(model), true);
			mailSender.send(mimeMessageHelper.getMimeMessage());
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	public void sendMail2(String to, String subject, String content) {
		MimeMessage mimeMessage = mailSender.createMimeMessage();
		try {
			MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);

			mimeMessageHelper.setSubject(subject);
			mimeMessageHelper.setTo(to);

			mimeMessageHelper.setText(this.geContentFromTemplate(), true);
			mailSender.send(mimeMessageHelper.getMimeMessage());
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("deprecation")
	public String geContentFromTemplate(Map<String, Object> model) {
		StringBuffer content = new StringBuffer();
		try {
			content.append(VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, "/configs/test.vm", model));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return content.toString();
	}

	public String geContentFromTemplate() {
		VelocityContext context = new VelocityContext();
		context.put("name", "Huy");
		//context.put("age", "18");
		StringWriter stringWriter = new StringWriter();
		velocityEngine.mergeTemplate("/configs/test.vm", "UTF-8", context, stringWriter);
		String text = stringWriter.toString();
		return text;
	}

}
