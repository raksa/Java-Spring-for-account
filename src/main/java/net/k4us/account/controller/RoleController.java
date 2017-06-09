package net.k4us.account.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.k4us.account.model.Role;
import net.k4us.account.service.RoleService;
import net.k4us.account.validator.RoleValidator;

@Controller
public class RoleController {

	@Autowired
	private RoleService roleService;

	@Autowired
	private RoleValidator roleValidator;

	@RequestMapping(value = "/role/{id}", method = RequestMethod.GET)
	public String role(Model model, @PathVariable("id") int id) {
		model.addAttribute("role", roleService.findById(id));
		return "role/role";
	}

	@RequestMapping(value = "/roles", method = RequestMethod.GET)
	public String roles(Model model) {
		model.addAttribute("roles", roleService.getAll());
		return "role/roles";
	}

	@RequestMapping(value = "role/add", method = RequestMethod.GET)
	public String registration(Model model) {
		model.addAttribute("roleForm", new Role());

		return "role/add";
	}

	@RequestMapping(value = "role/add", method = RequestMethod.POST)
	public String add(@ModelAttribute("roleForm") Role roleForm, BindingResult bindingResult, Model model) {
		roleValidator.validate(roleForm, bindingResult);

		if (bindingResult.hasErrors()) {
			return "role/add";
		}

		roleService.save(roleForm);

		return "redirect:/roles";
	}

	@RequestMapping(value = "role/delete", method = RequestMethod.POST)
	@ResponseBody
	public DeleteResData delete(@RequestBody DeleteReqData data) {
		// TODO: implement delete
		return new DeleteResData(data.id, "200", "not implement yet!");
	}
}

class DeleteReqData {
	public int id;
}

class DeleteResData {
	public int id;
	public String code;
	public String msg;

	public DeleteResData(int id, String code, String msg) {
		this.id = id;
		this.code = code;
		this.msg = msg;
	}
}