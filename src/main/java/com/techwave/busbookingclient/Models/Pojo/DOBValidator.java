package com.techwave.busbookingclient.Models.Pojo;

import java.time.LocalDate;
import java.time.Period;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class DOBValidator implements ConstraintValidator<DOBValidatorInterface, LocalDate>{

	@Override
	public boolean isValid(LocalDate value, ConstraintValidatorContext context) {
		// TODO Auto-generated method stub
		System.out.println(value);
		if(value==null)
		{
			return true;
		}
		else
		{
		int age=Period.between(value, LocalDate.now()).getYears();
		if(value!=null && (age<18 || age>80 )) 
				return false;
		}
		return true;
	}
}
