package unir.grupo6.pecoVerduras.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import unir.grupo6.pecoVerduras.modeloDao.ComentarioDao;
import unir.grupo6.pecoVerduras.modeloDao.CuentaUsuarioDao;
import unir.grupo6.pecoVerduras.modeloDao.DireccionDao;
import unir.grupo6.pecoVerduras.modeloDao.EmpresaDao;
import unir.grupo6.pecoVerduras.modeloDao.PedidoDao;
import unir.grupo6.pecoVerduras.modeloDao.PerfilDao;
import unir.grupo6.pecoVerduras.modeloDao.ProductoDao;
import unir.grupo6.pecoVerduras.modeloDao.ProductoFavoritoDao;
import unir.grupo6.pecoVerduras.modeloDao.ProductoPedidoDao;
import unir.grupo6.pecoVerduras.modeloDao.UsuarioDao;
import unir.grupo6.pecoVerduras.modeloEntity.Comentario;
import unir.grupo6.pecoVerduras.modeloEntity.CuentaUsuario;
import unir.grupo6.pecoVerduras.modeloEntity.Direccion;
import unir.grupo6.pecoVerduras.modeloEntity.Empresa;
import unir.grupo6.pecoVerduras.modeloEntity.Pedido;
import unir.grupo6.pecoVerduras.modeloEntity.Perfil;
import unir.grupo6.pecoVerduras.modeloEntity.Producto;
import unir.grupo6.pecoVerduras.modeloEntity.ProductoFavorito;
import unir.grupo6.pecoVerduras.modeloEntity.ProductoPedido;
import unir.grupo6.pecoVerduras.modeloEntity.Usuario;


/**
 * Controlador que gestiona todas las operaciones relacionadas con la parte del usuario.
 * 
 * @author Noelia
 */


@Controller
public class UsuarioController {
	
	/**
	* Se importan las clases necesarias para poder acceder a todos los métodos que tienen creados.
	*/
	@Autowired
	private EmpresaDao empresaDao;
	
	@Autowired
	private UsuarioDao usudao;
	
	@Autowired
	private ComentarioDao comentdao; 
	
	@Autowired
	private DireccionDao direcdao; 
	
	@Autowired
	private PedidoDao pdao;
	
	@Autowired
	private CuentaUsuarioDao cudao; 
	
	@Autowired
	private PerfilDao perfidao;
	
	@Autowired
	private ProductoPedidoDao propedao;
	
	@Autowired
	private ProductoDao productodao;
	
	@Autowired
	private ProductoFavoritoDao pfavdao; 
	
	
	/**
	 * Método que muestra la página del área personal del usuario cargando datos específicos.
	 * 
	 * @author Noelia
	 * 
	 * @param model, es un parametro que se utiliza para agregar atributos o sacar mensajes en las vistas.
	 * 
	 * @param session, Sesión HTTP es un parámetro que se utiliza para recoger el usuario que esta en session.
	 * 
	 * @return devuelve la vista de área personal del usuario.
	 */
	@GetMapping ("/usuario")
	public String mostrarUsuario (Model model, HttpSession session) {
		// Obtener información de la empresa
		Empresa emprea = empresaDao.buscarUnaEmpresa(1);
		model.addAttribute("empresa", emprea);
		
		// Obtener información del usuario desde la sesión
		Usuario user = (Usuario) session.getAttribute("usuario"); 
		
		// Obtener y agregar comentarios del usuario al modelo
		List<Comentario> coment = comentdao.mostrarComentariosUsuario(user); 
		model.addAttribute("comentario", coment);
		
		// Obtener y agregar direcciones del usuario al modelo
		List<Direccion> direct = direcdao.mostrarDireccionUsuario(user, "a"); 
		model.addAttribute("direccion", direct); 
		
		// Obtener y agregar pedidos del usuario al modelo
		List<Pedido> ped = pdao.mostrarPedidosUsuario(user); 
		model.addAttribute("pedido", ped);
		
		// Obtener y agregar cuentas de usuario al modelo
		List<CuentaUsuario> cuentusu = cudao.mostrarCreditCardCuentaUsuario(user, "a"); 
		model.addAttribute("cuentausuario", cuentusu);
		
	return "AreaPersonal"; 
	}
	
		
	/**
	 * Método que muestra los datos personales de un usuario específico.
	 * 
	 * @author Noelia
	 * 
	 * @param username, Nombre de usuario.
	 * 
	 * @param model, es un parametro que se utiliza para agregar atributos o sacar mensajes en las vistas.
	 * 
	 * @param session, Sesión HTTP es un parámetro que se utiliza para recoger el usuario que esta en session.
	 * 
	 * @return devuelve la vista de datos personales.
	 */
	@GetMapping ("/misDatosPersonales/{id}")
	public String mostrarDatosPersonalesUsuario (@PathVariable("id") String username, Model model, HttpSession session) {
		
		Usuario usu = usudao.buscarUnUsuario(username);
		model.addAttribute("usuario", usu); 
		
		//String username = (String) session.getAttribute("username");
	    //Usuario usuario = usudao.buscarUnUsuario(username);
	    //model.addAttribute("usuario", usuario);
		
		//model.addAttribute("mensaje", mensaje);
		
		Empresa emprea = empresaDao.buscarUnaEmpresa(1);
		model.addAttribute("empresa", emprea);	
		
	return "DatosPersonales"; 
	}
	
	
	/**
	 * Método que permite la edición de los datos personales de un usuario.
	 * 
	 * @author Noelia
	 * 
	 * @param model, es un parametro que se utiliza para agregar atributos o sacar mensajes en las vistas.
	 * 
	 * @param username, hace referencia al nombre de usuario.
	 * 
	 * @return devuelve la vista de edición de datos personales.
	 */
	@GetMapping ("/misDatosPersonalesEditarMiPerfil/{id}")
	public String editarDatosPersonalesUsuario (Model model, @PathVariable("id") String username) {
		
		Usuario usu = usudao.buscarUnUsuario(username);
		
		String contraseña = usu.getPassword();
		usu.setPassword(contraseña.substring(6));
		model.addAttribute("usuario", usu);
	
		Empresa emprea = empresaDao.buscarUnaEmpresa(1);
		model.addAttribute("empresa", emprea);
			
	return "DatosPersonales_EditarMiPerfil"; 
	}
	

	/**
	 * Método que actualiza los datos personales de un usuario.
	 * 
	 * @author Noelia
	 * 
	 * @param username, hace referencia al nombre de usuario.
	 * 
	 * @param usuario, Objeto Usuario con los datos actualizados, es decir, datos del usuario que se recogen desde la página de editar datos personales.
	 * 
	 * @param request, Objeto HttpServletRequest para obtener datos de la solicitud. Es decir, parametro que se usa para recoger los datos del formulario.
	 * 
	 * @param redirectAttributes, parámetro que se utiliza para agregar atributos o sacar mensajes en las vistas.
	 * 
	 * @return devuelve a la vista de datos personales.
	 */
	@PostMapping("/actualizarDatosPersonales/{id}")
	public String actualizarDatosPersonales(@PathVariable("id") String username, Usuario usuario, HttpServletRequest request, RedirectAttributes redirectAttributes) {
	    
		Usuario usuarioExistente = usudao.buscarUnUsuario(username);
		String password2 = request.getParameter("password2"); 
		String password = request.getParameter("password");
		//direc.set.calle(direccion.getcalle)
		
		if (password.equals(password2)) {
			
	        usuarioExistente.setNombre(usuario.getNombre());
	        usuarioExistente.setPrimerApellido(usuario.getPrimerApellido());
	        usuarioExistente.setSegundoApellido(usuario.getSegundoApellido());
	        usuarioExistente.setEmail(usuario.getEmail());
	        usuarioExistente.setTelefono(usuario.getTelefono());
	        usuarioExistente.setSexo(usuario.getSexo());
	        usuarioExistente.setFechaNacimiento(usuario.getFechaNacimiento());
	        usuarioExistente.setPassword("{noop}" + usuario.getPassword());
	        
	        usudao.modificarUsuario(usuarioExistente);
	        
			redirectAttributes.addFlashAttribute("mensaje", "Usuario modificado correctamente");

		}else {
			redirectAttributes.addFlashAttribute("mensajeError", "Las contraseñas no coinciden");
		}
	    return "redirect:/misDatosPersonales/{id}";   
}

	/**
	 * Inicializa el binder para el formato de fecha.
	 * 
	 * @param binder, parametro para registrar editores de fecha personalizados.
	 */
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}


    /**
     * Método que muestra la lista de pedidos realizados por el usuario.
     *
     * @author Noeli
     *
	 * @param model, es un parametro que se utiliza para agregar atributos o sacar mensajes en las vistas.
     * 
	 * @param session, Sesión HTTP es un parámetro que se utiliza para recoger el usuario que esta en session.
     * 
     * @return devuelve la vista de la lista de pedidos del usuario.
     */
	@GetMapping ("/misPedidos")

	public String mostrarMisPedidos (Model model, HttpSession session) { 

		Empresa emprea = empresaDao.buscarUnaEmpresa(1);
		model.addAttribute("empresa", emprea);
		Usuario user = (Usuario) session.getAttribute("usuario"); 

		List<Pedido> ped = pdao.mostrarPrecioDeUnPedido(user, "d");////
		model.addAttribute("pedido", ped);
		
	return "Pedidos"; 
	}
	
	
    /**
     * Método que muestra los detalles de un pedido específico.
     *
     * @author Noelia
     *
	 * @param model, es un parametro que se utiliza para agregar atributos o sacar mensajes en las vistas.
     * 
     * @param id parámetro que identifica de manera única al pedido al que se accede.
     * 
     * @return devuelve la vista de los detalles del pedido.
     */
	@GetMapping ("/pedido/{id}")
	public String mostrarPedidoId (Model model, @PathVariable("id") int id) { 
		Empresa emprea = empresaDao.buscarUnaEmpresa(1);
		model.addAttribute("empresa", emprea);
		
		//Usuario user = (Usuario) session.getAttribute("usuario");
		
		Pedido pedido = pdao.buscarUnPedido(id);
		model.addAttribute("pedido", pedido);
		
		List<ProductoPedido> pp = propedao.mostrarProductosPorPedido(pedido);
		model.addAttribute("pp", pp);
		
	return "VerPedido"; 
	}
	
	
	/**
	 * Método que muestra los productos favoritos de un usuario.
	 * 
	 * @author Noelia
	 * 
	 * @param model, parámetro modelo para agregar atributos que se utilizarán en la vista o sacar mensajes en las vistas.
	 * 
	 * @param session, Sesión HTTP es un parámetro que se utiliza para recoger el usuario que esta en session.
	 * 
	 * @return devuelve la vista "ProductosFav" que muestra los productos favoritos del usuario.
	 */
	@GetMapping ("/misProductosFavoritos")
	public String mostrarMisProductosFavoritos (Model model, HttpSession session ) {
		Empresa emprea = empresaDao.buscarUnaEmpresa(1);
		model.addAttribute("empresa", emprea);
		
		Usuario user = (Usuario) session.getAttribute("usuario");
		
		List<ProductoFavorito> productofav = pfavdao.mostrarTodosFavPorUsuario(user.getUsername(), "a");
		model.addAttribute("productofav", productofav);
		
	return "ProductosFav"; 
	}
	
	
	/**
	 * Método que cancela un producto de la lista de productos favoritos de un usuario.
	 * 
	 * @author Noelia
	 * 
	 * @param idFavorito, parámetro que hace referencia al ID del producto favorito a cancelar.
	 * 
	 * @param model, parámetro modelo para agregar atributos que se utilizarán en la vista o sacar mensajes en las vistas.
	 * 
	 * @param session, Sesión HTTP es un parámetro que se utiliza para recoger el usuario que esta en session.
	 * 
	 * @return devuelve la vista "misProductosFavoritos" después de cancelar el producto favorito.
	 */
	@GetMapping("/cancelarProductosFav/{id}")
	public String cancelarProductosFav(@PathVariable("id") int idFavorito, Model model, HttpSession session) {
		
		//Usuario user = (Usuario)session.getAttribute("usuario");
		
		//Direccion direccion = direcdao.buscarUnaDireccion(idDireccion);
		ProductoFavorito prodfav = pfavdao.buscarUnFavorito(idFavorito);
		
		if(prodfav != null) {
			System.out.println("modificar producto");
			prodfav.setEstado("d");
			pfavdao.modificarFAvorito(prodfav);
		}
		
		Empresa emprea = empresaDao.buscarUnaEmpresa(1);
		model.addAttribute("empresa", emprea);
		
		
		return "forward:/misProductosFavoritos";
	}
	
		
	/**
	 * Método que muestra las direcciones del usuario.
	 * 
	 * @author Noelia
	 * 
	 * @param model, parámetro modelo para agregar atributos que se utilizarán en la vista o sacar mensajes en las vistas.
	 * 
	 * @param session, Sesión HTTP es un parámetro que se utiliza para recoger el usuario que esta en session.
	 * 
	 * @return devuelve la vista "Direcciones" que muestra las direcciones del usuario.
	 */	
	@GetMapping ("/misDirecciones")
	public String mostrarMisDirecciones (Model model, HttpSession session) {
		
		Usuario user = (Usuario)session.getAttribute("usuario");
		
		List<Direccion> direc = direcdao.mostrarDireccionUsuario(user, "a");
		model.addAttribute("direccion", direc);
		
		Empresa emprea = empresaDao.buscarUnaEmpresa(1);
		model.addAttribute("empresa", emprea);
		
	return "Direcciones"; 
	}
	

	/**
	 * Método que permite editar una dirección del usuario.
	 * 
	 * @author Noelia
	 * 
	 * @param model, parámetro modelo para agregar atributos que se utilizarán en la vista o sacar mensajes en las vistas.
	 * 
	 * @param idDireccion, parámetro que representa el ID de la dirección a editar.
	 * 
	 * @param session, Sesión HTTP es un parámetro que se utiliza para recoger el usuario que esta en session.
	 * 
	 * @param aut, parametro del authentication que se usa para comprobar el usuario con la BBDD. Autenticación del usuario
	 * 
	 * @return devuelve la vista "DireccionesAñadirEditar" para editar la dirección.
	 */
	@GetMapping ("/misDireccionesEditar/{id}")
	public String editarMisDirecciones (Model model, @PathVariable("id") int idDireccion, HttpSession session, Authentication aut) {
		Empresa emprea = empresaDao.buscarUnaEmpresa(1);
		model.addAttribute("empresa", emprea);
		
		Usuario user = (Usuario)session.getAttribute("usuario");
		
		Usuario usu = usudao.buscarUnUsuario(user.getUsername());
		model.addAttribute("usu", usu);
		
		Direccion direc = direcdao.buscarUnaDireccion(idDireccion);
		model.addAttribute("direccion", direc);
		
	return "DireccionesAñadirEditar"; 
	}
	
	
	/**
	 * Método que permite agregar una nueva dirección.
	 * 
	 * @author Noelia
	 * 
	 * @param model, parámetro modelo para agregar atributos que se utilizarán en la vista o sacar mensajes en las vistas.
	 * 
	 * @param session, Sesión HTTP es un parámetro que se utiliza para recoger el usuario que esta en session.
	 * 
	 * @param aut, parametro del authentication que se usa para comprobar el usuario con la BBDD. Autenticación del usuario
	 * 
	 * @return devuelve la vista "DireccionesAñadirEditar" para agregar una nueva dirección.
	 */
	@GetMapping ("/agregarDireccion")
	public String agregarUnaDirecciones (Model model, HttpSession session, Authentication aut) {
		Empresa emprea = empresaDao.buscarUnaEmpresa(1);
		model.addAttribute("empresa", emprea);
		
		Usuario user = (Usuario)session.getAttribute("usuario");
		
		Usuario usu = usudao.buscarUnUsuario(user.getUsername());
		model.addAttribute("usu", usu);
		
		Direccion direc = new Direccion();
		model.addAttribute("direccion", direc);
		
	return "DireccionesAñadirEditar"; 
	}
	
	
	/**
	 * Método que agrega o edita una dirección del usuario.
	 * 
	 * @author Noelia
	 * 
	 * @param ratt, parámetro que se utiliza para agregar atributos o sacar mensajes en las vistas.
	 * 
	 * @param idDireccion, parámetro que hace refeencia al ID de la dirección a editar (si existe).
	 * 
	 * @param direc, parámetro que hae referencia a la dirección a agregar o editar.
	 * 
	 * @param session, Sesión HTTP es un parámetro que se utiliza para recoger el usuario que esta en session.
	 * 
	 * @return devuelve a la vista "misDirecciones" después de agregar o editar la dirección.
	 */	
	@PostMapping("/saveDirecciones/{id}")
	public String agregarEditarDireccion(RedirectAttributes ratt, @PathVariable("id") int idDireccion, Direccion direc, HttpSession session) {
		
		Direccion direccion = new Direccion();
		
		Direccion direction = direcdao.buscarUnaDireccion(idDireccion);
		
		Usuario user = (Usuario)session.getAttribute("usuario");
		
		if(direction != null) {
			direction.setCalle(direc.getCalle()); 
			direction.setNumero(direc.getNumero()); 
			direction.setPiso(direc.getPiso());
			direction.setPoblacion(direc.getPoblacion());
			direction.setProvincia(direc.getProvincia());
			direction.setPais(direc.getPais());
			direction.setPuerta(direc.getPuerta()); 
			direction.setVivienda(direc.getVivienda());
			
			direcdao.modificarDireccion(direction);
			
			ratt.addFlashAttribute("mensaje", "Tu dirección se ha modificado correctamente");
		}else {
			direccion.setCalle(direc.getCalle()); 
			direccion.setNumero(direc.getNumero()); 
			direccion.setPiso(direc.getPiso());
			direccion.setPoblacion(direc.getPoblacion());
			direccion.setProvincia(direc.getProvincia());
			direccion.setPais(direc.getPais());
			direccion.setPuerta(direc.getPuerta()); 
			direccion.setVivienda(direc.getVivienda());
			direccion.setEstado("a");
			direccion.setUsuario(user);
			
			direcdao.insertarDireccion(direccion); 
			
			ratt.addFlashAttribute("mensaje", "Tu dirección ha sido añadida con éxito");
		}
		
		return "redirect:/misDirecciones";
	}
	
	 
	 /**
	  * Método que cancela una dirección.
	  * 
	  * @author Noelia
	  * 
	  * @param idDireccion, parámetro que hace referencia al ID de la dirección a cancelar.
	  * 
	  * @param model, parámetro modelo para agregar atributos que se utilizarán en la vista o sacar mensajes en las vistas.
	  * 
	  * @param session, Sesión HTTP es un parámetro que se utiliza para recoger el usuario que esta en session.
	  * 
	  * @return devuelve la vista "Direcciones" después de cancelar la dirección.
	  */
	@GetMapping("/cancelarDireccion/{id}")
	public String cancelarUnaDireccion(@PathVariable("id") int idDireccion, Model model, HttpSession session) {
		
		Usuario user = (Usuario)session.getAttribute("usuario");
		
		Direccion direccion = direcdao.buscarUnaDireccion(idDireccion);
		
		if(direccion != null) {
			direccion.setEstado("d");
			direcdao.modificarDireccion(direccion);
		}
		
		Empresa emprea = empresaDao.buscarUnaEmpresa(1);
		model.addAttribute("empresa", emprea);
		
		List<Direccion> direc = direcdao.mostrarDireccionUsuario(user, "a");
		model.addAttribute("direccion", direc);
		
		return "Direcciones"; 
	}

	
/***************************************************************************************************************************/	

	
	/**
	 * Método que muestra los métodos de pago del usuario.
	 * 
	 * @author Noelia
	 * 
	 * @param model, parámetro modelo para agregar atributos que se utilizarán en la vista o sacar mensajes en las vistas.
	 * 
	 * @param session, Sesión HTTP es un parámetro que se utiliza para recoger el usuario que esta en session.
	 *
	 * @param aut, parametro del authentication que se usa para comprobar el usuario con la BBDD. Autenticación del usuario.
	 * 
	 * @return devuelve la vista "MetodosDePago" que muestra los métodos de pago del usuario.
	 */
	@GetMapping ("/misMetodosDePago")
	public String mostrarMisMetodosDePago (Model model, HttpSession session, Authentication aut) {
		Empresa emprea = empresaDao.buscarUnaEmpresa(1);
		model.addAttribute("empresa", emprea);
		
		Usuario user = (Usuario)session.getAttribute("usuario");
		
		List<CuentaUsuario> cuentausu = cudao.mostrarCreditCardCuentaUsuario(user, "a");
		model.addAttribute("cuentausu", cuentausu); 
		
	return "MetodosDePago"; 
	}
	
	
	/**
	 * Método que permite editar un método de pago (una tarjeta de crédito) del usuario.
	 * 
	 * @author Noeli
	 * 
	 * @param model, parámetro modelo para agregar atributos que se utilizarán en la vista o sacar mensajes en las vistas.
	 * 
	 * @param idCuenta, parámetro que hace referencia al ID de la cuenta a editar.
	 * 
	 * @param session, Sesión HTTP es un parámetro que se utiliza para recoger el usuario que esta en session.
	 * 
	 * @return devuelve la vista "MetodosDePagoEditarAñadir" para editar el método de pago.
	 */
	@GetMapping ("/misMetodosDePagoEditar/{id}")
	public String añadirMisMetodosDePago (Model model, @PathVariable("id") int idCuenta, HttpSession session) {
		Empresa emprea = empresaDao.buscarUnaEmpresa(1);
		model.addAttribute("empresa", emprea);
		
		CuentaUsuario cu = cudao.buscarUnaCuenta(idCuenta); 
		model.addAttribute("cu", cu); 
		
	return "MetodosDePagoEditarAñadir"; 
	}
	
	@GetMapping ("/misMetodosDePagoAdd")
	public String añadirMisMetodosDePago (Model model, HttpSession session) {
		
		
		Empresa emprea = empresaDao.buscarUnaEmpresa(1);
		model.addAttribute("empresa", emprea);
	 
	return "MetodosDePagoAñadir"; 
	}
	@PostMapping("/misMetodosDePagoAdd")
	public String agregarMisMetodosDePago(CuentaUsuario cuentaUsuario, HttpSession session, RedirectAttributes ratt) {
		
		Usuario user = (Usuario)session.getAttribute("usuario");
		
		
		CuentaUsuario cuenta = cudao.buscarUnaCuenta(cuentaUsuario.getIdCuenta());
		if(cuenta == null) {
			cuentaUsuario.setEstado("a"); 
			cuentaUsuario.setSaldo(2000);
			cuentaUsuario.setUsuario(user);
			cudao.insertarCuenta(cuentaUsuario);
			
			ratt.addFlashAttribute("mensaje", "Credit card ha sido añadida correctamente ");
		}else {
			ratt.addFlashAttribute("mensajeError", "Credit card no ha podido añadirse");
		}
		return "redirect:/misMetodosDePago";
		
	}
	
	
	/**
	 * Método que actualiza un método de pago (una tarjeta de crédito del usuario) existente.
	 * 
	 * @author Noelia
	 * 
	 * @param idCuenta, parámetro que hace referencia al ID de la cuenta de usuario a actualizar.
	 * 
	 * @param cuentausu, parámetro que hace referencia a la cuenta de usuario con los datos actualizados.
	 * 
	 * @param redirectAttributes, parametro que utilizamos para agregar atributos o sacar mensajes en las vistas
	 * 
	 * @return devuelve a la vista "misMetodosDePago" después de actualizar el método de pago.
	 */
	@PostMapping ("/actualizarMetodosDePago/{id}")
	public String actualizarMetodosDePago (@PathVariable("id") int idCuenta, CuentaUsuario cuentausu, RedirectAttributes redirectAttributes) {
		
		CuentaUsuario cuentaExistente = cudao.buscarUnaCuenta(idCuenta);
		if(cuentaExistente != null) {
			cuentaExistente.setNumeroTarjeta(cuentausu.getNumeroTarjeta()); 
			cuentaExistente.setNombre(cuentausu.getNombre()); 
			cuentaExistente.setApellido(cuentausu.getApellido()); 
			cuentaExistente.setCaducidad(cuentausu.getCaducidad()); 
			cuentaExistente.setCvc(cuentausu.getCvc());
			
			cudao.modificarCuenta(cuentaExistente);
			
			redirectAttributes.addFlashAttribute("mensaje", "Credit card modificada correctamente");
		}else {
			redirectAttributes.addFlashAttribute("mensajeError", "Credit card no ha podido ser modificada");
		}
		return "redirect:/misMetodosDePago";
	}
	


	/**
	 * Método que cancela un método de pago, es decir, una tarjeta de crédito del usuario.
	 * 
	 * @author Noelia
	 * 
	 * @param idCuenta, este parámetro es el ID de la cuenta de usuario a cancelar.
	 * 
	 * @param model, parámetro modelo para agregar atributos que se utilizarán en la vista o sacar mensajes en las vistas.
	 * 
	 * @param session, Sesión HTTP es un parámetro que se utiliza para recoger el usuario que esta en session.
	 * 
	 * @return devuelve la vista "misMetodosDePago" después de cancelar el método de pago.
	 */
	@GetMapping("/misMetodosDePagoCancelar/{id}")
	public String cancelarMetodoDePago(@PathVariable("id") int idCuenta, Model model, HttpSession session) {
		
		//Usuario user = (Usuario)session.getAttribute("usuario");
		
		//Direccion direccion = direcdao.buscarUnaDireccion(idDireccion);
		CuentaUsuario cuusu = cudao.buscarUnaCuenta(idCuenta); 
		
		if(cuusu != null) {
			System.out.println("modificar tarjeta");
			cuusu.setEstado("d");
			cudao.modificarCuenta(cuusu); 
		}
		
		Empresa emprea = empresaDao.buscarUnaEmpresa(1);
		model.addAttribute("empresa", emprea);
		
		
		return "forward:/misMetodosDePago";
	}
	

	/**
	 * Método que muestra la vista del PecoClub con los puntos del usuario según los pedidos del usuario.
	 * 
	 * @author Noelia
	 * 
	 * @param model, parámetro modelo para agregar atributos que se utilizarán en la vista o sacar mensajes en las vistas.
	 * 
	 * @param session, Sesión HTTP es un parámetro que se utiliza para recoger el usuario que esta en session.
	 * 
	 * @return devuelve la vista "PecoClub" que muestra los puntos de los pedidos del usuario.
	 */
	@GetMapping ("/pecoClub")
	public String mostrarPecoClub (Model model, HttpSession session) {
		
		Usuario user = (Usuario)session.getAttribute("usuario");
		List<Pedido> pedi = pdao.mostrarPuntosPorUsuarioEstado(user, "d");
		model.addAttribute("pedido", pedi);
		
		Empresa emprea = empresaDao.buscarUnaEmpresa(1);
		model.addAttribute("empresa", emprea);
		
	return "PecoClub"; 
	}
	
	/**
	 * Método que cambia la condición de un usuario a Cliente premium con sus beneficios correspondientes.
	 * 
	 * @author Noelia
	 * 
	 * @param username, se refiere al nombre de usuario del cliente a cambiar a premium.
	 * 
	 * @param model, parámetro modelo para agregar atributos que se utilizarán en la vista o sacar mensajes en las vistas.
	 * 
	 * @return devuelve a la vista "pecoClub" después de intentar cambiar el rol del usuario.
	 */
	@GetMapping("/hacerPremium/{id}")
	public String cambiarClientePremium(@PathVariable("id") String username, Model model) {
		Empresa emprea = empresaDao.buscarUnaEmpresa(1);
		model.addAttribute("empresa", emprea);
		
		Usuario user = usudao.buscarUnUsuario(username);
		
		List<Pedido> pedi = pdao.mostrarPuntosPorUsuarioEstado(user, "d");
		model.addAttribute("pedido", pedi);
		
		 String rol = " ";
	        
	        Authentication aut = SecurityContextHolder.getContext().getAuthentication();
	        
	        for (GrantedAuthority roles : aut.getAuthorities()) {
	             rol = roles.getAuthority();
	        }
	        
	        Perfil perfi = new Perfil();
	        
	        if (rol.equals("ROLE_CLIENTE")) {
	            
	            List<Perfil> perfiles = user.getPerfiles();
	            for (Perfil perfil : perfiles) {
	                if (perfil.getNombre().equals("ROLE_CLIENTE")) {
	                    perfi = perfidao.buscarUnPerfil(3);
	                    break;
	                    
	                }
	            }
	         
	            if(perfi != null) {
	            	user.getPerfiles().clear();
 	        	   	user.addPerfil(perfi);
 	        	   	usudao.modificarUsuario(user);
 	        	   	
 	        	   model.addAttribute("mensaje", "El Usuario a Cambiado a ClienteVIP");
	            }
	           
	            
	        } else {
	            model.addAttribute("mensajeError", "Error el Usuario no ha podido ser cambiado a ClienteVIP");
	        }
	        
	        
	        return "forward:/pecoClub";	
	    }
			
			
	/**
	 * Método que muestra los comentarios del usuario.
	 * 
	 * @author Noelia
	 * 
	 * @param model, parámetro modelo para agregar atributos que se utilizarán en la vista o sacar mensajes en las vistas.
	 *
	 * @param session, Sesión HTTP es un parámetro que se utiliza para recoger el usuario que esta en session.
	 * 
	 * @return devuelve la vista "MisComentarios" si el usuario tiene comentarios, o "MisComentarioVacio" si no tiene.
	 */
	@GetMapping ("/misComentarios")
	public String mostrarMisComentarios (Model model, HttpSession session ) {
		
		Empresa emprea = empresaDao.buscarUnaEmpresa(1);
		model.addAttribute("empresa", emprea);
		
		Usuario user = (Usuario) session.getAttribute("usuario");
		
		List<Comentario> coment = comentdao.mostrarComentariosUsuario(user); 
		
		if(comentdao.mostrarComentariosUsuario(user).isEmpty()) {
			return "MisComentarioVacio";
		}else {
			model.addAttribute("comentario", coment);
			return "MisComentarios"; 
		}

	}
}
