/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author theta
 */
public class validation {

    public static final Pattern VALID_EMAIL_ADDRESS_REGEX
            = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);

    public static final Pattern VALID_PHONE_NUMBER_REGEX = Pattern.compile("^\\d{10}$");
    public static final Pattern VALID_FULL_NAME_REGEX = Pattern.compile("[\\\\d]+[A-Za-z0-9\\\\s,\\\\.]+");
    public static final Pattern VALID_ADDRESS_REGEX = Pattern.compile("[\\\\d]+[A-Za-z0-9\\\\s,\\\\.]+");

    public static boolean isValidEmail(String email) {
        Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(email);
        return matcher.find();
    }

    public static boolean isValidPhoneNumber(String phoneNumber) {
        Matcher matcher = VALID_PHONE_NUMBER_REGEX.matcher(phoneNumber);
        return matcher.find();
    }

    public static boolean isValidFullName(String fullName) {
        Matcher matcher = VALID_FULL_NAME_REGEX.matcher(fullName);
        return matcher.find();
    }

    public static boolean isValidAddress(String address) {
        Matcher matcher = VALID_ADDRESS_REGEX.matcher(address);
        return matcher.find();
    }

    public static String encryptPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] encodeHash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
        return bytesToHex(encodeHash);
    }
    
    public static String bytesToHex(byte[] hash){
        StringBuilder hexString = new StringBuilder(2 * hash.length);
        for (int i = 0; i< hash.length; i++){
            String hex = Integer.toHexString(0xff & hash[i]);
            if(hex.length() == 1){
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }
    
    
//    public static void main(String[] args) throws NoSuchAlgorithmException {
//        String a = "thetank1xb1";
//        String b = encryptPassword(a);
//        System.out.println(b);
//    }
}
