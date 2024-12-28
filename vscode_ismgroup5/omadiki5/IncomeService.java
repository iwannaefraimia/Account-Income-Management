package omadiki5;

import java.sql.*;

/**
 * StudentService
 */
public class IncomeService {

    public void insertIncome(Incomes income) throws Exception {

        DB db = new DB();
        Connection con = null;
        String sql = "INSERT INTO incomes (rec_ID, rec_DateKatath, rec_DateTaiped, rec_AmountDeposit, rec_Dosi_Etos, rec_Descr, rec_SAP, rec_AccID, rec_AssetID, rec_IncomeType) VALUES (?,?,?,?,?,?,?,?,?,?);";

        try {

            con = db.getConnection();
            PreparedStatement smt = con.prepareStatement(sql);

            // setting parameters
            smt.setInt(1, income.getRec_ID());
            smt.setDate(2, income.getRec_DateKatath());
            smt.setDate(3, income.getRec_DateTaiped());
            smt.setBigDecimal(4, income.getRec_AmountDeposit());
            smt.setString(5, income.getRec_Dosi_Etos());
            smt.setString(6, income.getRec_Descr());
            smt.setString(7, income.getRec_SAP());
            smt.setString(8, income.getRec_AccID());
            smt.setInt(9, income.getRec_AssetID());
            smt.setInt(10, income.getRec_IncomeType());

            smt.executeUpdate();

            smt.close();
            db.close();

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {

            }

        }

    }
}
