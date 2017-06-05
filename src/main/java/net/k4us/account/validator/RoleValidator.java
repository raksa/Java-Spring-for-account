package net.k4us.account.validator;

import net.k4us.account.model.Role;
import net.k4us.account.service.RoleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class RoleValidator implements Validator {
	@Autowired
	private RoleService roleService;

	@Override
	public boolean supports(Class<?> aClass) {
		return Role.class.equals(aClass);
	}

	@Override
	public void validate(Object o, Errors errors) {
		Role role = (Role) o;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty");

		String ePattern = "^[A-Z][A-Z0-9]*_[A-Z][A-Z0-9]*$";
		java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
		java.util.regex.Matcher m = p.matcher(role.getName());
		if (!m.matches()) {
			errors.rejectValue("name", "Valid.roleForm.name");
		}

		if (roleService.findByName(role.getName()) != null) {
			errors.rejectValue("name", "Duplicate.roleForm.name");
		}
	}
}
