package com.skip.www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class ChatController {

	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);

	@GetMapping("/chat.do")
	public String chat(Model model) {
		
		logger.info("==================================");
		logger.info("[Controller] : chat.do ");

		return "chatting";
	}
}
