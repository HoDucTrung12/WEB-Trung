package fashion_shop.DAO;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fashion_shop.entity.Account;

@Transactional
@Repository
public class accountDAO {
	@Autowired
	SessionFactory factory;
	
	public List<Account> getLUser() {
		Session session = factory.getCurrentSession();
		String hql = "From Account";
		Query query = session.createQuery(hql);
		List<Account> listUser = query.list();
		return listUser;
	}
}
