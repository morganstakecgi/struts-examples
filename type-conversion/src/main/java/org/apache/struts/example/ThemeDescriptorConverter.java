package org.apache.struts.example;

import com.opensymphony.xwork2.conversion.TypeConversionException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts.model.ThemeDescriptor;
import org.apache.struts.model.Themes;
import org.apache.struts2.util.StrutsTypeConverter;

import java.util.Map;

public class ThemeDescriptorConverter extends StrutsTypeConverter {

    private static final Logger LOG = LogManager.getLogger(ThemeDescriptorConverter.class);

    @SuppressWarnings("rawtypes")
    @Override
    public Object convertFromString(final Map context, final String[] values, final Class toClass) {
        if ((values != null) && (values.length > 0)) {
            try {
                if (Themes.contains(values[0])) {
                    return Themes.get(values[0]);
                }
                throw new RuntimeException("No theme with id: " + values[0]);
            } catch (Exception e) {
                throw new TypeConversionException("Unable to convert into a ThemeDescriptor: " + values[0], e);
            }
        }
        return null;
    }

    @SuppressWarnings("rawtypes")
    @Override
    public String convertToString(final Map context, final Object value) {
        try {
            return ((ThemeDescriptor) value).getId();
        } catch (Exception e) {
            LOG.error("Unable to convert {0} into a string", e, value);
        }
        return null;
    }
}
