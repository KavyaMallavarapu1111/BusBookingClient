package com.techwave.busbookingclient.Models.Pojo;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;

@Target({ ElementType.METHOD, ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = CheckTicketDOJValidator.class)
public @interface CheckTicketDOJValidatorInterface {
	public String message() default "DateOfJourney should be in next 2 days not today and previous days";
	Class<?>[] groups() default {};
	Class<? extends Payload>[] payload() default {};
}
