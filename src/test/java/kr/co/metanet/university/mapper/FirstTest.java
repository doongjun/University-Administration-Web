package kr.co.metanet.university.mapper;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.metanet.university.config.RootConfig;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes= {RootConfig.class})
public class FirstTest {

	@Inject
	private SqlSessionFactory sqlSessionFactory;
	
	@Test
	public void testFactory() {
		System.out.println(sqlSessionFactory);
	}
	
	@Test
	public void testSession() {
		try(SqlSession sqlSession = sqlSessionFactory.openSession()) {
			System.out.println(sqlSession);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
