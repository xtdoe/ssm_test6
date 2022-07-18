import com.whut.dao.IUserDao;
import com.whut.pojo.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class testSQL {
    @Autowired
    IUserDao dao;

    @Test
    public void testDao() {
        List<User> movies = dao.findAll();
        for (User movie : movies) {
            System.out.println(movie);
        }
    }
}
