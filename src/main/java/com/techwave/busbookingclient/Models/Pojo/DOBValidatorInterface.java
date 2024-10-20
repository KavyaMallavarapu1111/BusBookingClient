package com.techwave.busbookingclient.Models.Pojo;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import java.lang.annotation.ElementType;
import java.lang.annotation.RetentionPolicy;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;



@Target({ ElementType.METHOD, ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = DOBValidator.class)
public @interface DOBValidatorInterface {
	public String message() default "Age should be in between 18 and 80";
	Class<?>[] groups() default {};
	Class<? extends Payload>[] payload() default {};
}
