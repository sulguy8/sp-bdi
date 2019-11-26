package com.sp.bdi.test.test4;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("computer")
public class Computer {
	private String cpu;
	private String ram;
	private String hdd;
	@Autowired
	private Monitor monitor; // String name = "LG 24인치"
	
	public String getCpu() {
		return cpu;
	}
	@Autowired // string 2가지를 찾음. 따라서 qualifier로 지정을 해줘야함.
	public void setCpu(@Qualifier("cpu1") String cpu) {
		this.cpu = cpu;
	}
	public String getRam() {
		return ram;
	}
	@Autowired 
	@Qualifier("ram1") // setCpu와 달리 파라미터 밖으로 빼도 된다.
	public void setRam( String ram) {
		this.ram = ram;
	}
	public String getHdd() {
		return hdd;
	}
	public void setHdd(String hdd) {
		this.hdd = hdd;
	}
	
	@Override
	public String toString() {
		return "Computer [cpu=" + cpu + ", ram=" + ram + ", hdd=" + hdd + ", monitor=" + monitor + "]";
	}
	
}
