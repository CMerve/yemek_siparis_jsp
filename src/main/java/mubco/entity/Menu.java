package mubco.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="menu")
public class Menu {
	@Id
    @Column(name="urun_id",  length=11,unique = true, nullable = false)
	private int urunID;
	@Column(name="urun_ad", length=50)
	private String urunAd;
	@Column(name="urun_aciklama", length=150)
	private String urunAciklama;
	@Column(name="urun_fiyat", length=20)
	private String urunFiyat;
	@Column(name="urun_gorsel", length=200)
	private String urunGorsel;
	
	public int getUrunID() {
		return urunID;
	}
	public void setUrunID(int urunID) {
		this.urunID = urunID;
	}
	public String getUrunAd() {
		return urunAd;
	}
	public void setUrunAd(String urunAd) {
		this.urunAd = urunAd;
	}
	public String getUrunAciklama() {
		return urunAciklama;
	}
	public void setUrunAciklama(String urunAciklama) {
		this.urunAciklama = urunAciklama;
	}
	public String getUrunFiyat() {
		return urunFiyat;
	}
	public void setUrunFiyat(String urunFiyat) {
		this.urunFiyat = urunFiyat;
	}

	public String getUrunGorsel() {
		return urunGorsel;
	}
	public void setUrunGorsel(String urunGorsel) {
		this.urunGorsel = urunGorsel;
	}
	public Menu(int urunID, String urunAd, String urunAciklama, String urunFiyat, String urunGorsel) {
		super();
		this.urunID = urunID;
		this.urunAd = urunAd;
		this.urunAciklama = urunAciklama;
		this.urunFiyat = urunFiyat;
		this.urunGorsel = urunGorsel;
	}
	public Menu() {
		
	}
	
	

}
