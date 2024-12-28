package omadiki5;

import java.sql.Date;
import java.math.BigDecimal;

public class Incomes {

    private int rec_ID;
    private Date rec_DateKatath;
    private Date rec_DateTaiped;
    private BigDecimal rec_AmountDeposit;
    private String rec_Dosi_Etos;
    private String rec_Descr;
    private String rec_SAP;
    private String rec_AccID;
    private int rec_AssetID;
    private int rec_IncomeType;

    public Incomes(int rec_ID, Date rec_DateKatath, Date rec_DateTaiped, BigDecimal rec_AmountDeposit,
            String rec_Dosi_Etos, String rec_Descr, String rec_SAP, String rec_AccID, int rec_AssetID,
            int rec_IncomeType) {
        this.rec_ID = rec_ID;
        this.rec_DateKatath = rec_DateKatath;
        this.rec_DateTaiped = rec_DateTaiped;
        this.rec_AmountDeposit = rec_AmountDeposit;
        this.rec_Dosi_Etos = rec_Dosi_Etos;
        this.rec_Descr = rec_Descr;
        this.rec_SAP = rec_SAP;
        this.rec_AccID = rec_AccID;
        this.rec_AssetID = rec_AssetID;
        this.rec_IncomeType = rec_IncomeType;
    }

    public int getRec_ID() {
        return rec_ID;
    }

    public void setAm(int rec_ID) {
        this.rec_ID = rec_ID;
    }

    public Date getRec_DateKatath() {
        return rec_DateKatath;
    }

    public void setRec_DateKatath(Date rec_DateKatath) {
        this.rec_DateKatath = rec_DateKatath;
    }

    public Date getRec_DateTaiped() {
        return rec_DateTaiped;
    }

    public void setRec_DateTaiped(Date rec_DateTaiped) {
        this.rec_DateTaiped = rec_DateTaiped;
    }

    public BigDecimal getRec_AmountDeposit() {
        return rec_AmountDeposit;
    }

    public void setRec_AmountDeposit(BigDecimal rec_AmountDeposit) {
        this.rec_AmountDeposit = rec_AmountDeposit;
    }

    public String getRec_Dosi_Etos() {
        return rec_Dosi_Etos;
    }

    public void setRec_Dosi_Etos(String rec_Dosi_Etos) {
        this.rec_Dosi_Etos = rec_Dosi_Etos;
    }

    public String getRec_Descr() {
        return rec_Descr;
    }

    public void setRec_Descr(String rec_Descr) {
        this.rec_Descr = rec_Descr;
    }

    public String getRec_SAP() {
        return rec_SAP;
    }

    public void setRec_SAP(String rec_SAP) {
        this.rec_SAP = rec_SAP;
    }

    public String getRec_AccID() {
        return rec_AccID;
    }

    public void setRec_AccID(String rec_AccID) {
        this.rec_AccID = rec_AccID;
    }

    public int getRec_AssetID() {
        return rec_AssetID;
    }

    public void setRec_AssetID(int rec_AssetID) {
        this.rec_AssetID = rec_AssetID;
    }

    public int getRec_IncomeType() {
        return rec_IncomeType;
    }

    public void setRec_IncomeTypeint(int rec_IncomeType) {
        this.rec_IncomeType = rec_IncomeType;
    }

}