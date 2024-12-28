package omadiki5;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class IncomeTypeService {

    /**
     * Returns all available income types.
     */
    public List<IncomeType> getIncomeTypes() throws Exception {

        List<IncomeType> incomeTypes = new ArrayList<IncomeType>();

        DB db = new DB();
        Connection con = null;
        String query = "SELECT * FROM incometypes;";

        try {

            con = db.getConnection();

            PreparedStatement stmt = con.prepareStatement(query);
            // skipping setting parameters (do not need)

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                incomeTypes.add(new IncomeType(
                        rs.getInt("incometype_ID"),
                        rs.getString("incometype_Name"),
                        rs.getString("incometype_ALE")));

            }

            rs.close();
            stmt.close();
            db.close();

            return incomeTypes;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {

            }

        }

    } // End of getIncomeTypes

    public void deleteIncomeType(String ALE) throws Exception {

        DB db = new DB();
        Connection con = null;
        String sql = "DELETE FROM incometypes where incometype_ALE=?;";

        try {

            con = db.getConnection();
            PreparedStatement smt = con.prepareStatement(sql);

            // setting parameters
            smt.setString(1, ALE);

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

    public void updateIncomeType(IncomeType incometype) throws Exception {

        DB db = new DB();
        Connection con = null;
        String sql = "UPDATE incometypes SET incometype_Name=?, incometype_ALE=? WHERE incometype_ID=?;";

        try {

            con = db.getConnection();
            PreparedStatement smt = con.prepareStatement(sql);

            // setting parameters
            smt.setString(1, incometype.getIncomeTypeName());
            smt.setString(2, incometype.getIncomeTypeALE());
            smt.setInt(3, incometype.getIncomeTypeID());
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

    public void insertIncomeType(IncomeType IncomeType) throws Exception {

        DB db = new DB();
        Connection con = null;
        String sql = "INSERT INTO incometypes (incometype_Name, incometype_ALE) VALUES (?,?);";

        try {

            con = db.getConnection();
            PreparedStatement smt = con.prepareStatement(sql);

            smt.setString(1, IncomeType.getIncomeTypeName());
            smt.setString(2, IncomeType.getIncomeTypeALE());

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

    } // End of insert new method

}
