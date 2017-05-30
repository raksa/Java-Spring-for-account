package net.k4us.account.validator;

import net.k4us.account.model.User;
import net.k4us.account.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class UserValidator implements Validator {
	@Autowired
	private UserService userService;

	@Override
	public boolean supports(Class<?> aClass) {
		return User.class.equals(aClass);
	}

	@Override
	// TODO: make better validate
	public void validate(Object o, Errors errors) {
		User user = (User) o;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "NotEmpty");

		// if (user.getUsername().length() < 1 || user.getUsername().length() >
		// 32) {
		// errors.rejectValue("username", "Size.userForm.username");
		// }

		if (userService.findByUsername(user.getUsername()) != null) {
			errors.rejectValue("username", "Duplicate.userForm.username");
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty");

		// if (!isValidEmailAddress(user.getEmail())) {
		// errors.rejectValue("email", "Valid.userForm.email");
		// }

		// if (userService.findByEmail(user.getEmail()) != null) {
		// errors.rejectValue("email", "Duplicate.userForm.email");
		// }

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
		// if (user.getPassword().length() < 8 || user.getPassword().length() >
		// 32) {
		// errors.rejectValue("password", "Size.userForm.password");
		// }

		// if (!user.getPasswordConfirm().equals(user.getPassword())) {
		// errors.rejectValue("passwordConfirm",
		// "Diff.userForm.passwordConfirm");
		// }
	}

	private boolean isValidEmailAddress(String email) {
		String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
		java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
		java.util.regex.Matcher m = p.matcher(email);
		return m.matches();
	}
}
