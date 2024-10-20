package com.techwave.busbookingclient.Models.Pojo;

import java.time.LocalDate;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class CheckTicketDOJValidator implements ConstraintValidator<CheckTicketDOJValidatorInterface, LocalDate>{

	@Override
	public boolean isValid(LocalDate value, ConstraintValidatorContext context) {
		// TODO Auto-generated method stub
		if(value==null)
		{
			return true;
		}
		else
		{
			LocalDate today=LocalDate.now();
			LocalDate limitDays=today.plusDays(2);
			if(value.compareTo(limitDays)<=0&&value.compareTo(today)>=0)
			{
				return true;
			}
		}
		return false;
	}
}
