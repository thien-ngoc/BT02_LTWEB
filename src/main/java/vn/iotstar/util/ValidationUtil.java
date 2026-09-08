package vn.iotstar.util;

import java.util.regex.Pattern;

public class ValidationUtil {

    private static final Pattern EMAIL_PATTERN =
            Pattern.compile("^[\\w.+-]+@[\\w-]+\\.[a-zA-Z]{2,}$");
    private static final Pattern PHONE_PATTERN = Pattern.compile("^[0-9]{10}$");
    private static final Pattern USERNAME_PATTERN = Pattern.compile("^[a-zA-Z0-9_]{4,20}$");
    private static final Pattern OTP_PATTERN = Pattern.compile("^[0-9]{6}$");

    public static boolean isBlank(String s) { return s == null || s.trim().isEmpty(); }

    public static boolean isValidEmail(String s) { return !isBlank(s) && EMAIL_PATTERN.matcher(s.trim()).matches(); }

    public static boolean isValidPhone(String s) { return isBlank(s) || PHONE_PATTERN.matcher(s.trim()).matches(); }

    public static boolean isValidUsername(String s) { return !isBlank(s) && USERNAME_PATTERN.matcher(s.trim()).matches(); }

    public static boolean isValidOtp(String s) { return !isBlank(s) && OTP_PATTERN.matcher(s.trim()).matches(); }

    public static boolean isMinLength(String s, int min) { return !isBlank(s) && s.trim().length() >= min; }

    public static boolean isPositiveDecimal(String s) {
        if (isBlank(s)) return false;
        try { return new java.math.BigDecimal(s).compareTo(java.math.BigDecimal.ZERO) > 0; }
        catch (NumberFormatException e) { return false; }
    }

    public static boolean isNonNegativeInt(String s) {
        if (isBlank(s)) return false;
        try { return Integer.parseInt(s.trim()) >= 0; }
        catch (NumberFormatException e) { return false; }
    }
}