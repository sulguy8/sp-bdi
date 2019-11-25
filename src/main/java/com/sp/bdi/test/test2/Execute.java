package com.sp.bdi.test.test2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Execute {
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("ioc/ioc-2.xml"); // 절대경로라 ioc부터 작성해도됨. 따로 메모리를 안만들어도 호출하면 미리 메모리를 생성하고 나옴. 이것이 spring에서 preloading 사용하는 방법.
		CarMaker cm = (CarMaker)ac.getBean("carMaker");
		System.out.println(cm.makeCar());
	}
}
