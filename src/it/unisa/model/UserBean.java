package it.unisa.model;

public class UserBean {
	
    private String username;
    private String password;
    private String Nome;
    private String Cognome;
    private String DataN;
    private String Citta;
    private String Via;
    private String CAP;
    public boolean valid;
	
	
    public String getFirstName() {
       return Nome;
	}

    public void setFirstName(String newFirstName) {
       Nome = newFirstName;
	}

	
    public String getLastName() {
       return Cognome;
			}

    public void setLastName(String newLastName) {
       Cognome = newLastName;
			}
			

    public String getPassword() {
       return password;
	}

    public void setPassword(String newPassword) {
       password = newPassword;
	}
	
			
    public String getUsername() {
       return username;
			}

    public void setUsername(String newUsername) {
       username = newUsername;
			}
				
    public String getDataN() {
		return DataN;
	}

	public void setDataN(String dataN) {
		DataN = dataN;
	}

	public String getCitta() {
		return Citta;
	}

	public void setCitta(String citta) {
		Citta = citta;
	}

	public String getVia() {
		return Via;
	}

	public void setVia(String via) {
		Via = via;
	}

	public String getCAP() {
		return CAP;
	}

	public void setCAP(String cAP) {
		CAP = cAP;
	}

	public boolean isValid() {
       return valid;
	}

    public void setValid(boolean newValid) {
       valid = newValid;
	}

	@Override
	public String toString() {
		return username + " " + password;
	}	
    
    
}

