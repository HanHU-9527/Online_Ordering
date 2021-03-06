package dao.impl;

import bean.Food;
import bean.News;
import dao.NewsDao;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import utils.JDBCUtils;

import java.util.List;

public class NewsDaoImpl implements NewsDao {

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public void addNews(News news) {
        String sql = "INSERT INTO news VALUES(null,?,now(),now(),?)";

        String content = TextToHtml(news.getContent());

        //System.out.println(content);

        template.update(sql,news.getTitle(),content);
    }


    public   static   String   TextToHtml(String   sourcestr)
    {
        int   strlen;
        String   restring="",   destr   =   "";
        strlen   =   sourcestr.length();
        for           (int   i=0;   i<strlen;           i++)
        {
            char   ch=sourcestr.charAt(i);
            switch   (ch)
            {
                case   '<':
                    destr   =   "<";
                    break;
                case   '>':
                    destr   =   ">";
                    break;
                case   '\"':
                    destr   =   "";
                    break;
                case   '&':
                    destr   =   "&";
                    break;
                case   13:
                    destr   =   "<br>";
                    break;
                case   32:
                    destr   =   "&nbsp;";
                    break;
                default   :
                    destr   =   ""   +   ch;
                    break;
            }
            restring   =   restring   +   destr;
        }
        return   ""   +   restring;
    }



    @Override
    public List<News> findAll() {
        String sql = "select * from news";
        List<News> news = template.query(sql, new BeanPropertyRowMapper<News>(News.class));
        return news;
    }

    @Override
    public void delNews(int id) {
        String sql = "delete from news where id = ?";
        template.update(sql,id);

    }

    @Override
    public News findByNewsId(int id) {
        String sql = "select * from news where id = ?";
        News news = template.queryForObject(sql, new BeanPropertyRowMapper<News>(News.class), id);
        return news;
    }

    @Override
    public void updateNews(News news) {
        String sql = "update news set title = ?, content = ?, update_date = now() where id = ?";
        template.update(sql,news.getTitle(),news.getContent(),news.getId());
    }





}
