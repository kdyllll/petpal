package com.project.petpal.payment.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.StringTokenizer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.petpal.member.model.vo.Member;
import com.project.petpal.payment.model.service.PaymentService;
import com.project.petpal.payment.model.vo.Cart;
import com.project.petpal.payment.model.vo.Payment;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService service;
	
	//결제 페이지로 정보 보내주기
	@RequestMapping("/payment/payment.do")
	public ModelAndView payment(ModelAndView mv, HttpServletRequest request, HttpServletResponse response, HttpSession session,
								String memberNo,
								@RequestParam(value="productName", required=false) String[] productName,
								@RequestParam(value="size", required=false) String[] size,
								@RequestParam(value="color", required=false) String[] color,
								@RequestParam(value="count", required=false) int[] count,
								@RequestParam(value="cnt", required=false) int[] cnt,
								@RequestParam(value="price", required=false) int[] price,
								@RequestParam(value="stockNo") String[] stockNo,
								@RequestParam(value="click", required=false) String[] click) {
		
		//총 상품 금액
		int totalProduct = 0;
		//총 결제 금액
		int totalPrice = 0;
		//배송비
		int fee = 0;
		int pprice = 0;
		int pcount = 0;
		String pproductName = "";
		String psize = "";
		String pcolor = "";
		String pstockno = "";
		
		//cnt는 바로구매에서 넘어오는 수량
		if(productName==null) {
			List<Map> list = service.selectProduct(stockNo[0]);
			pprice = Integer.parseInt(String.valueOf(list.get(0).get("PRICE")));
			pcount = cnt[0];
			pcolor = String.valueOf(list.get(0).get("COLOR"));
			pproductName = String.valueOf(list.get(0).get("PRODUCTNAME"));
			psize = String.valueOf(list.get(0).get("PRODUCTSIZE"));
			pstockno = stockNo[0];
			totalProduct = totalProduct + (pcount * pprice);
		}else {
			//상품이 체크되어있는지 확인. check상태면 click==1, 아니면 click==0. click이 1인 애를 찾아서 수량에 따라 상품 값 계산 후 총 상품 금액에 더해줌 
			for(int i=0;i<price.length;i++) {
				if(click[i].equals("1")) {
					totalProduct = totalProduct + (count[i] * price[i]);
				}
			}
		}
		
		//만약 상품 금액이 5만원 미만이면 배송비 2500원 추가, 이상이면 배송비 0
		if(totalProduct < 50000) {
			fee = 2500;
			totalPrice = totalProduct + 2500;
		}else {
			totalPrice = totalProduct;
		}
		
		//jsp에 넘길 list
		List list = new ArrayList();
		
		//Cart 객체 생성
		Cart c = Cart.builder().build();
		
		//cnt는 바로구매에서 넘어오는 수량
				if(productName==null) {
					//각 조건에 따라 Cart 객체에 데이터 추가 후 list에 추가
					if(psize==null) {
						c = Cart.builder().productName(pproductName).color(pcolor).count(pcount).price(pcount * pprice).fee(fee).totalProduct(totalProduct).totalPrice(totalPrice).stockNo(pstockno).build();
					}else if(pcolor==null) {
						c = Cart.builder().productName(pproductName).productSize(psize).count(pcount).price(pcount * pprice).fee(fee).totalProduct(totalProduct).totalPrice(totalPrice).stockNo(pstockno).build();
					}else {
						c = Cart.builder().productName(pproductName).productSize(psize).color(pcolor).count(pcount).price(pcount * pprice).fee(fee).totalProduct(totalProduct).totalPrice(totalPrice).stockNo(pstockno).build();
					}
					list.add(c);
				}else {
					//각 조건에 따라 Cart 객체에 데이터 추가 후 list에 추가
					for(int i=0; i<count.length;i++) {
						if(click[i].equals("1")) {
							if(size.length==0 && color.length!=0) {
								c = Cart.builder().productName(productName[i]).color(color[i]).count(count[i]).price(count[i] * price[i]).fee(fee).totalProduct(totalProduct).totalPrice(totalPrice).stockNo(stockNo[i]).build();
							}else if(size.length!=0 && color.length==0) {
								c = Cart.builder().productName(productName[i]).productSize(size[i]).count(count[i]).price(count[i] * price[i]).fee(fee).totalProduct(totalProduct).totalPrice(totalPrice).stockNo(stockNo[i]).build();
							}else {
								c = Cart.builder().productName(productName[i]).productSize(size[i]).color(color[i]).count(count[i]).price(count[i] * price[i]).fee(fee).totalProduct(totalProduct).totalPrice(totalPrice).stockNo(stockNo[i]).build();
							}
							list.add(c);
						}
					}
				}
	
		//jsp에 보낼 list
		mv.addObject("list", list);
		
		//로그인 상태면
		if((Member)session.getAttribute("loginMember")!=null) {
			Member loginMember=(Member)session.getAttribute("loginMember");
			memberNo = loginMember.getMemberNo();
			
			//회원의 포인트를 받아와서 포인트와 회원번호를 보내줌
			int point = service.selectPoint(memberNo);
			mv.addObject("point", point);
			mv.addObject("memberNo", memberNo);
			mv.setViewName("payment/payment");
		}else {
			//로그인 상태가 아니면
			mv.setViewName("payment/paymentNonMember");
		}
		return mv;
	}

	//결제 정보 모두 입력 후
	@RequestMapping("/payment/paymentComplete.do")
	public ModelAndView paymentComplete(ModelAndView mv, HttpServletRequest request, HttpServletResponse response, HttpSession session,
										@RequestParam(value="stockNo") String[] stockNo,
										@RequestParam(value="totalPrice") int totalPrice,
										@RequestParam(value="cnt") int[] cnt,
										@RequestParam(value="receiverName") String receiverName,
										@RequestParam(value="loc") String loc,
										@RequestParam(value="locDetail") String locDetail,
										@RequestParam(value="receiverTel") String receiverTel,
										@RequestParam(value="name") String name,
										@RequestParam(value="email") String email,
										@RequestParam(value="tel") String tel,
										@RequestParam(value="point") int point,
										@RequestParam(value="pointMinus") int pointMinus,
										@RequestParam(value="payKind") String payKind,
										@RequestParam(value="holder") String holder,
										@RequestParam(value="bank") String bank,
										@RequestParam(value="bankSelect") String bankSelect,
										@RequestParam(value="account") String account) throws UnsupportedEncodingException {
		
		//8자리 난수 생성
		Random rand = new Random();

		String orderNo = Integer.toString(rand.nextInt(8) + 1);

		for(int i=0; i < 7; i++){
			orderNo += Integer.toString(rand.nextInt(9));
		}

		//로그인 상태면
		if((Member)session.getAttribute("loginMember")!=null) {
			Member loginMember=(Member)session.getAttribute("loginMember");
			
			String memberNo = loginMember.getMemberNo();
			
			loc = loc + " " + locDetail;
			
			String refundName = holder.replaceAll(",", "");
			String refundBank = "";
			if(bankSelect.equals("")) {
				refundBank = bank.replaceAll(",", "");
			}else {
				refundBank = bankSelect.replaceAll(",", "");
			}
			String refundAccount = account.replaceAll(",", "");
			
			//총 결제 금액에서 사용한 포인트 빼기
			totalPrice = totalPrice - pointMinus;
			
			//총 결제 금액의 10% 포인트 적립
			int pointPlus = (int) (totalPrice * 0.1);
			
			//최종 포인트
			point = point - pointMinus + pointPlus;
			
			String payStatus = "";
			//카드면 결제완료 현금이면 결제대기
			if(payKind.equals("신용카드")) {
				payStatus = "결제완료";
			}else {
				payStatus = "결제대기";
			}
			
			Payment p = Payment.builder().memberNo(memberNo).receiverName(receiverName).loc(loc).receiverTel(receiverTel).pointPlus(pointPlus).pointMinus(pointMinus).name(name).email(email).tel(tel).totalPrice(totalPrice).payKind(payKind).payStatus(payStatus).orderNo(orderNo).refundName(refundName).refundBank(refundBank).refundAccount(refundAccount).build();
			
			//payment테이블에 insert
			int result = service.insertPayment(p, cnt, stockNo);
			
			//insert에 성공하면 list와 point를 보내줌
			if(result>0) {
				mv.addObject("list", service.selectPaymentCompleteList(orderNo));
				mv.addObject("point", point);
			}
			
			String paymentNo = service.selectPaymentNo(orderNo);
			List<String> no = service.selectStockNo(paymentNo);
			
			//결제 완료된 상품 장바구니에서 삭제
			for(int i=0;i<no.size();i++) {
				int r = service.deleteCart(no.get(i), memberNo); 
			}
			
			if(payKind.equals("신용카드")) {
				mv.setViewName("payment/paymentCompleteCredit");
			}else {
				mv.setViewName("payment/paymentCompleteCash");
			}
			
		}else {
			//비회원일 때
			
			loc = loc + " " + locDetail;
			
			String refundName = holder.replaceAll(",", "");
			String refundBank = "";
			if(bankSelect.equals("")) {
				refundBank = bank.replaceAll(",", "");
			}else {
				refundBank = bankSelect.replaceAll(",", "");
			}
			String refundAccount = account.replaceAll(",", "");
			
			String payStatus = "";
			//카드면 결제완료 현금이면 결제대기
			if(payKind.equals("신용카드")) {
				payStatus = "결제완료";
			}else {
				payStatus = "결제대기";
			}
			
			Payment p = Payment.builder().receiverName(receiverName).loc(loc).receiverTel(receiverTel).name(name).email(email).tel(tel).totalPrice(totalPrice).payKind(payKind).payStatus(payStatus).orderNo(orderNo).refundName(refundName).refundBank(refundBank).refundAccount(refundAccount).build();
			
			int result = service.insertPayment(p, cnt, stockNo);
			
			if(result>0) {
				mv.addObject("list", service.selectPaymentCompleteList(orderNo));
			}
			
			//주문번호를 통해 해당 결제번호를 select
			String paymentNo = service.selectPaymentNo(orderNo);
			
			//결제번호를 통해 재고번호를 select
			List<String> no = service.selectStockNo(paymentNo);
			
			// 쿠키값 가져오기
		    Cookie[] cookie = request.getCookies() ;
		    
		    //StringTokenizer할 배열 생성
			String[] cart = new String[cookie.length];
		    
			//쿠키값 저장하기 위한 리스트
		    List<String> co = new ArrayList<String>();
		    List<String> amount = new ArrayList<String>();
		    
		    //쿠키가 있을 때 실행
			if(cookie.length>1) {
				//쿠키에서 값을 가져와 cart배열에 넣어줌
				//index 0의 값은 session id이므로 index 1에서 부터 시작
			    for(int i=1;i<cookie.length;i++){
			    	cart[i] = URLDecoder.decode(cookie[i].getValue(),"UTF-8");
			    }
				
			  //cart배열에서 ","을 기준으로 값을 잘라줌
			    StringTokenizer st1 = new StringTokenizer(cart[1], ",");
			    StringTokenizer st2 = new StringTokenizer(cart[2], ",");
			    
			    //자른 값을 각각 stockNo와 amount 리스트에 넣어줌
			    while(st1.hasMoreTokens()) {
			    	co.add(st1.nextToken());
			    }
			    while(st2.hasMoreTokens()) {
			    	amount.add(st2.nextToken());
			    }
			}
			
		    //removeAll 메소드를 통해 쿠키에 있는 값에서 결제한 상품들의 재고번호가 담겨있는 no리스트와 일치하는 값들을 제거
		    co.removeAll(no);
		    
			//새로운 쿠키를 담기 위해 기존 쿠키를 비워줌
			for(int i=0;i<cookie.length;i++) {
				cookie[i].setMaxAge(0);
			}
			
			//쿠키에 담을 String 변수
			String stocks = "";
			String amounts = "";
			
			//쿠키용 String 변수에 결제하지 않은 재고번호를 넣어줌
			for(int i=0;i<co.size();i++) {
				if(stocks.equals("")) {
					stocks=co.get(i);
				}else {
					stocks=stocks+","+co.get(i);
				}
				if(amounts.equals("")) {
					amounts=amount.get(i);
				}else {
					amounts=amounts+","+amount.get(i);
				}
			}
			
			//쿠키 생성
			Cookie c=new Cookie("cookieStock",URLEncoder.encode(stocks, "UTF-8"));
			c.setMaxAge(60 * 60 * 24); //쿠키 하루 유지
			c.setPath("/");//모든 곳에서 사용할 수 있게
			response.addCookie(c); //쿠키 추가
			Cookie c2=new Cookie("cookieCnt",URLEncoder.encode(amounts, "UTF-8"));
			c2.setMaxAge(60 * 60 * 24);
			c2.setPath("/");
			response.addCookie(c2);
			
			if(payKind.equals("신용카드")) {
				mv.setViewName("payment/paymentCompleteCreditNonMember");
			}else {
				mv.setViewName("payment/paymentCompleteCashNonMember");
			}
			
		}
		
		return mv;
	}
	
	//ajax 통신을 통해 재고를 jsp에 보내줌 
	@RequestMapping("/payment/selectStock.do")
	@ResponseBody
	public List<String> selectStock(String[] stockNo) {
		
		//재고를 담을 리스트
		List<String> stock = new ArrayList<String>();
		
		//재고번호를 통해 재고를 select해서 list에 담아줌
		for(int i=0;i<stockNo.length;i++) {
			stock.add(service.selectStock(stockNo[i]));
		} 

		//재고 return
		return stock;
	}
	
	//ajax통신을 통해 회원 정보로부터 회원의 이름, 주소 등을 보내줌
	@RequestMapping("/payment/getAddress.do")
	@ResponseBody
	public HashMap<String, String> getAddress(String memberNo){
		//회원번호로 정보들을 조회
		List<Map> info = service.selectAddress(memberNo);

		//info리스트에서 각 변수에 해당하는 값들을 빼서 변수에 저장
		String memberName = (String) info.get(0).get("MEMBERNAME");
		String phone = (String) info.get(0).get("PHONE");
		String add = (String) info.get(0).get("ADDRESS");
		String email = (String) info.get(0).get("EMAIL");
		
		//stringTokenizer로 우편번호, 주소, 상세주소를 각각 잘라서 addr 리스트에 담아줌
		List<String> addr = new ArrayList<String>();
		
	    StringTokenizer st = new StringTokenizer(add, ",");
	    
	    while(st.hasMoreTokens()) {
	    	addr.add(st.nextToken());
	    }
	    
	    String post = addr.get(0);
	    String address = addr.get(1);
	    String detail = addr.get(2);
	    
	    //전화번호에 "-" 추가하기 위한 StringBuffer생성
	    StringBuffer origin = new StringBuffer(phone);
		
	    //전화번호에 "-"추가
		origin.insert(3, "-");
		origin.insert(8, "-");
		
	    phone = origin.toString();
	    
	    //jsp에 보낼 user 생성
	    HashMap<String, String> user = new HashMap<String, String>();
	    
	    user.put("memberName", memberName);
	    user.put("phone", phone);
	    user.put("post", post);
	    user.put("address", address);
	    user.put("detail", detail);
	    user.put("email", email);
	    
		return user;
	}
	
}
