/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.io.Serializable;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/**
 *
 * @author Dell
 */
public class FormatDate implements Serializable {

    private static SimpleDateFormat sdf = null;

    public static String formatDate(Timestamp timestamp) {
        sdf = new SimpleDateFormat("dd-MM-yyyy");
        return sdf.format(timestamp);
    }

}
