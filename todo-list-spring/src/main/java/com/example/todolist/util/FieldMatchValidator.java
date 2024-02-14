package com.example.todolist.util;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

import java.lang.reflect.Field;

public class FieldMatchValidator implements ConstraintValidator<FieldMatch, Object> {
    private String firstFieldName;
    private String secondFieldName;

    @Override
    public void initialize(final FieldMatch constraintAnnotation) {
        firstFieldName = constraintAnnotation.first();
        secondFieldName = constraintAnnotation.second();
    }

    @Override
    public boolean isValid(final Object value, final ConstraintValidatorContext context) {
        try {
            Object firstObj = getFieldValue(value, firstFieldName);
            Object secondObj = getFieldValue(value, secondFieldName);

            return firstObj == null && secondObj == null || firstObj != null && firstObj.equals(secondObj);
        } catch (final NoSuchFieldException | IllegalAccessException e) {
            e.printStackTrace();
            return false;
        }
    }

    private Object getFieldValue(Object value, String fieldName) throws NoSuchFieldException, IllegalAccessException {
        Field field = value.getClass().getDeclaredField(fieldName);
        field.setAccessible(true);
        return field.get(value);
    }
}