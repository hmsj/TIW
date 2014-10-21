package es.uc3m.tiw.contenedores;

public class User {
	
	private long id;
	private int type;
	private String enterprise;
	private int documentType;
	private String document;
	private String password;
	private String name;
	private String lastName;
	private String secondLastName;
	private String address;
	
	public final long getId() {
		return id;
	}
	public final void setId(long id) {
		this.id = id;
	}
	public final int getType() {
		return type;
	}
	public final void setType(int type) {
		this.type = type;
	}
	public final String getEnterprise() {
		return enterprise;
	}
	public final void setEnterprise(String enterprise) {
		this.enterprise = enterprise;
	}
	public final String getDocument() {
		return document;
	}
	public final void setDocument(String document) {
		this.document = document;
	}
	public int getDocumentType() {
		return documentType;
	}
	public void setDocumentType(int documetType) {
		this.documentType = documetType;
	}
	public final String getPassword() {
		return password;
	}
	public final void setPassword(String password) {
		this.password = password;
	}
	public final String getName() {
		return name;
	}
	public final void setName(String name) {
		this.name = name;
	}
	public final String getLastName() {
		return lastName;
	}
	public final void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public final String getSecondLastName() {
		return secondLastName;
	}
	public final void setSecondLastName(String secondLastName) {
		this.secondLastName = secondLastName;
	}
	public final String getAddress() {
		return address;
	}
	public final void setAddress(String address) {
		this.address = address;
	}

}
