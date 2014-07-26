package core.util;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.text.DecimalFormat;
import java.util.Hashtable;
import java.util.Map;

/**
 * Created by Andrei-PC on 7/24/2014.
 */
public class DocumentUtil {

    private static Map<String, Boolean> documentUploadValidFiles = new Hashtable<String, Boolean>();

    private static final String PDF = "pdf";
    private static final String JPEG = "jpeg";
    private static final String JPG = "jpg";
    private static final String PNG = "png";


    /**
     * Can upload files only with maximum size of 10 MB
     */
    private static final long MAX_FILE_SIZE_ALLOWED = 10485760;


    public DocumentUtil() {

        documentUploadValidFiles.put(PDF, true);
        documentUploadValidFiles.put(JPEG, true);
        documentUploadValidFiles.put(JPG, true);
        documentUploadValidFiles.put(PNG, true);
    }


    /**
     * Check if the file is a PDF of image file
     *
     * @param file
     * @return
     */
    public static boolean isDocumentValidForUpload(CommonsMultipartFile file) {

        Boolean isValid = false;

        if (file == null) {
            return isValid;
        }

        String name = file.getOriginalFilename();
        String extension = FilenameUtils.getExtension(file.getOriginalFilename());
        isValid = documentUploadValidFiles.get(extension);
        if (isValid == null || !isValid) {
            isValid = false;
        }


        return isValid;

    }

    /**
     * Check if file size is smaller than maximum allowed
     *
     * @param fileSize
     * @return
     */
    public boolean fileSizeValid(long fileSize) {

        if (fileSize > MAX_FILE_SIZE_ALLOWED) {
            return false;
        }

        return true;

    }

    public static String floatForm(double d) {
        return new DecimalFormat("#.##").format(d);
    }


    /**
     * Convert document size to a human readable size
     * @param size
     * @return
     */
    public static String bytesToHuman(long size) {

        long Kb = 1 * 1024;
        long Mb = Kb * 1024;
        long Gb = Mb * 1024;
        long Tb = Gb * 1024;
        long Pb = Tb * 1024;
        long Eb = Pb * 1024;

        if (size < Kb) return floatForm(size) + " byte";
        if (size >= Kb && size < Mb) return floatForm((double) size / Kb) + " Kb";
        if (size >= Mb && size < Gb) return floatForm((double) size / Mb) + " Mb";
        if (size >= Gb && size < Tb) return floatForm((double) size / Gb) + " Gb";
        if (size >= Tb && size < Pb) return floatForm((double) size / Tb) + " Tb";
        if (size >= Pb && size < Eb) return floatForm((double) size / Pb) + " Pb";
        if (size >= Eb) return floatForm((double) size / Eb) + " Eb";

        return "???";
    }

}
