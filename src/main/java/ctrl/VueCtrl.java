package ctrl;

import java.io.*;
import java.net.*;
import java.util.*;
import javax.servlet.http.*;
import org.json.simple.*;
import org.json.simple.parser.*;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.json.simple.*;
import org.json.simple.parser.*;
import svc.*;
import vo.*;

@Controller
public class VueCtrl {
	private VueSvc vueSvc;

	public void setVueSvc(VueSvc vueSvc) {
		this.vueSvc = vueSvc;
	}
	
	@GetMapping("/vueIndex")
	public String vueIndex() { return "vue/vueIndex"; }
	
	@GetMapping("/basicIndex")
	public String basicIndex() { return "vue/basic/basicIndex"; }
	@GetMapping("/propertyPrint")
	public String propertyPrint() { return "vue/basic/propertyPrint"; }
	@GetMapping("/dataPrint")
	public String dataPrint() { return "vue/basic/dataPrint"; }
	@GetMapping("/arrayPrint")
	public String arrayPrint() { return "vue/basic/arrayPrint"; }
	@GetMapping("/objectPrint")
	public String objectPrint() { return "vue/basic/objectPrint"; }
	@GetMapping("/jsDataPrint")
	public String jsDataPrint() { return "vue/basic/jsDataPrint"; }
	@GetMapping("/allDataPrint")
	public String allDataPrint() { return "vue/basic/allDataPrint"; }
	
	@GetMapping("/directiveIndex")
	public String directiveIndex() { return "vue/directive/directiveIndex"; }
	@GetMapping("/vBindEx1")
	public String vBindEx1() { return "vue/directive/vBindEx1"; }
	@GetMapping("/vBindEx2")
	public String vBindEx2() { return "vue/directive/vBindEx2"; }
	@GetMapping("/vBindEx3")
	public String vBindEx3() { return "vue/directive/vBindEx3"; }
	@GetMapping("/textEx")
	public String textEx() { return "vue/directive/textEx"; }
	@GetMapping("/checkboxEx")
	public String checkboxEx() { return "vue/directive/checkboxEx"; }
	@GetMapping("/radioEx")
	public String radioEx() { return "vue/directive/radioEx"; }
	@GetMapping("/comboEx")
	public String comboEx() { return "vue/directive/comboEx"; }
	@GetMapping("/countEx")
	public String countEx() { return "vue/directive/countEx"; }
	@GetMapping("/arrayEx")
	public String arrayEx() { return "vue/directive/arrayEx"; }
	@GetMapping("/lazyEx")
	public String lazyEx() { return "vue/directive/lazyEx"; }
	@GetMapping("/numberEx")
	public String numberEx() { return "vue/directive/numberEx"; }
	@GetMapping("/trimEx")
	public String trimEx() { return "vue/directive/trimEx"; }
	@GetMapping("/evtClickEx")
	public String evtClickEx() { return "vue/directive/evtClickEx"; }
	@GetMapping("/evtKeyupEx")
	public String evtKeyupEx() { return "vue/directive/evtKeyupEx"; }
	@GetMapping("/evtCalEx")
	public String evtCalEx() { return "vue/directive/evtCalEx"; }
	@GetMapping("/controlEx")
	public String controlEx() { return "vue/directive/controlEx"; }
	
	@GetMapping("/ifforIndex")
	public String ifforIndex() { return "vue/iffor/ifforIndex"; }
	@GetMapping("/ifEx1")
	public String ifEx1() { return "vue/iffor/ifEx1"; }
	@GetMapping("/ifEx2")
	public String ifEx2() { return "vue/iffor/ifEx2"; }
	@GetMapping("/forEx1")
	public String forEx1() { return "vue/iffor/forEx1"; }
	@GetMapping("/forEx2")
	public String forEx2() { return "vue/iffor/forEx2"; }
	@GetMapping("/forEx3")
	public String forEx3() { return "vue/iffor/forEx3"; }
	@GetMapping("/forEx4")
	public String forEx4() { return "vue/iffor/forEx4"; }
	@GetMapping("/forEx5")
	public String forEx5() { return "vue/iffor/forEx5"; }
	@GetMapping("/forEx6")
	public String forEx6() { return "vue/iffor/forEx6"; }
	@GetMapping("/forEx7")
	public String forEx7() { return "vue/iffor/forEx7"; }
	@GetMapping("/forEx8")
	public String forEx8() { return "vue/iffor/forEx8"; }
	@GetMapping("/forEx9")
	public String forEx9() { return "vue/iffor/forEx9"; }
	@GetMapping("/forEx10")
	public String forEx10() { return "vue/iffor/forEx10"; }
	
	@GetMapping("/etcIndex")
	public String etcIndex() { return "vue/etc/etcIndex"; }
	@GetMapping("/chartEx1")
	public String chartEx1() { return "vue/etc/chartEx1"; }
	@GetMapping("/chartEx2")
	public String chartEx2() { return "vue/etc/chartEx2"; }
	@GetMapping("/transEx1")
	public String transEx1() { return "vue/etc/transEx1"; }
	@GetMapping("/transEx2")
	public String transEx2() { return "vue/etc/transEx2"; }
	@GetMapping("/transEx3")
	public String transEx3() { return "vue/etc/transEx3"; }
	@GetMapping("/todoEx1")
	public String todoEx1() { return "vue/etc/todoEx1"; }
	@GetMapping("/todoEx2")
	public String todoEx2() { return "vue/etc/todoEx2"; }
	@GetMapping("/cmpReplyEx1")
	public String cmpReplyEx1() { return "vue/etc/cmpReplyEx1"; }
	@GetMapping("/cmpReplyEx2")
	public String cmpReplyEx2(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		int flidx = Integer.parseInt(request.getParameter("flidx"));
		// int�� �޴´� -> ���� ������� ���ɼ��� ����.

		List<FreeReply> replyList = vueSvc.getFreeReplyList(flidx);

		request.setAttribute("replyList", replyList);
//		model.addAttribute("freeReply", freeReply);
		
		return "vue/etc/cmpReplyEx2";
	}
	@GetMapping("/replyDel")
	@ResponseBody	// �ڹ� ��ü�� http ����� ��ü�� ��ȯ�Ͽ� ����
	public String replyDel(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		int fridx = Integer.parseInt(request.getParameter("fridx"));
		// int�� �ٲٴ� ���� : ����, �������
		int flidx = Integer.parseInt(request.getParameter("flidx"));
		
		int result = vueSvc.replyDel(fridx, flidx);
		
		return result + "";
		
	}
	@PostMapping("/replyAdd")
	@ResponseBody
	public String replyAdd(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		int flidx = Integer.parseInt(request.getParameter("flidx"));
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		String ip = request.getRemoteAddr();
		
		FreeReply fr = new FreeReply();
		fr.setFl_idx(flidx);
		fr.setMi_id(writer);
		fr.setFr_content(content);
		fr.setFr_ip(ip);
		
		JSONObject jo = vueSvc.replyInsert(fr);
		
		return jo.toString();
		
	}
	@PostMapping("/replyUp")
	@ResponseBody
	public String replyUp(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		int fridx = Integer.parseInt(request.getParameter("fridx"));
		String content = request.getParameter("content");
		
		FreeReply fr = new FreeReply();
		fr.setFr_idx(fridx);		fr.setFr_content(content);
		int result = vueSvc.replyUpdate(fr);
		
		return result + "";
	}
	@GetMapping("/cmpReply3")
	public String cmpReply3(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		int flidx = Integer.parseInt(request.getParameter("flidx"));
		List<FreeReply> replyList = vueSvc.getFreeReplyList(flidx);
		request.setAttribute("replyList", replyList);
		return "vue/etc/cmpReply3";
	}
	
	@GetMapping("/compIndex")
	public String compIndex() { return "vue/comp/compIndex"; }
	@GetMapping("/compEx1")
	public String compEx1() { return "vue/comp/compEx1"; }
	@GetMapping("/compEx2")
	public String compEx2() { return "vue/comp/compEx2"; }
	@GetMapping("/compEx3")
	public String compEx3() { return "vue/comp/compEx3"; }
	@GetMapping("/compEx4")
	public String compEx4() { return "vue/comp/compEx4"; }
	@GetMapping("/watchEx1")
	public String watchEx1() { return "vue/comp/watchEx1"; }
	@GetMapping("/watchEx2")
	public String watchEx2() { return "vue/comp/watchEx2"; }
	@GetMapping("/watchEx3")
	public String watchEx3() { return "vue/comp/watchEx3"; }
	
	@GetMapping("/componentIndex")
	public String componentIndex() { return "vue/component/componentIndex"; }
	@GetMapping("/componentEx1")
	public String componentEx1() { return "vue/component/componentEx1"; }
	@GetMapping("/componentEx2")
	public String componentEx2() { return "vue/component/componentEx2"; }
	@GetMapping("/componentEx3")
	public String componentEx3() { return "vue/component/componentEx3"; }
	@GetMapping("/componentEx4")
	public String componentEx4() { return "vue/component/componentEx4"; }
	@GetMapping("/componentEx5")
	public String componentEx5() { return "vue/component/componentEx5"; }
	@GetMapping("/componentEx6")
	public String componentEx6() { return "vue/component/componentEx6"; }
	@GetMapping("/jsonCompEx1")
	public String jsonCompEx1() { return "vue/component/jsonCompEx1"; }
	@GetMapping("/jsonCompEx2")
	public String jsonCompEx2() { return "vue/component/jsonCompEx2"; }
	@GetMapping("/jsonCompEx3")
	public String jsonCompEx3() { return "vue/component/jsonCompEx3"; }
}
