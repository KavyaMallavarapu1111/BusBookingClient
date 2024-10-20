package com.techwave.busbookingclient.Models.Pojo;

import java.time.LocalDate;
import java.time.Period;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class DOJValidator implements ConstraintValidator<DOJValidatorInterface, LocalDate>{

	@Override
	public boolean isValid(LocalDate value, ConstraintValidatorContext context) {
		// TODO Auto-generated method stub
		if(value!=null) {
			LocalDate today=LocalDate.now();
			int check=value.compareTo(today);
			if(check<0)
				
				return false;
		}
		return true;
}
}