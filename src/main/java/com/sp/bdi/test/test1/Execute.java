package com.sp.bdi.test.test1;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;

public class Execute {
	public static void main(String[] args) {
	
	FileSystemResource fsr = new FileSystemResource("src/main/resources/ioc/ioc-1.xml");
	BeanFactory beanFactory = new XmlBeanFactory(fsr);
	
	Human h = (Human)beanFactory.getBean("h");
	
	List<Human> hmList = new ArrayList<Human>();
	hmList.add((Human)beanFactory.getBean("h"));
	
	h.setAge(20);
	
	System.out.println(hmList);
	
	}
}
