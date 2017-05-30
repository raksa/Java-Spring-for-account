package net.k4us.account.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.k4us.account.service.RoleService;

@Controller
public class RoleController {

	@Autowired
	private RoleService roleService;

	@RequestMapping(value = "/role/{id}/**", method = RequestMethod.GET)
	public String role(Model model, @PathVariable("id") int id) {
		model.addAttribute("role", roleService.findById(id));
		return "role/role";
	}

	@RequestMapping(value = "/roles", method = RequestMethod.GET)
	public String roles(Model model) {
		model.addAttribute("roles", roleService.getAll());
		return "role/roles";
	}
}
