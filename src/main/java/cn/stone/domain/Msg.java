package cn.stone.domain;

import java.util.HashMap;
import java.util.Map;

/**
 * @program: crud
 * @description: 响应结果类
 * @author: Stone
 * @create: 2020-02-18 22:29
 **/
public class Msg {
    //状态码 100成功 200失败
    private int code;

    //相应成功/失败信息
    private String message;


    //对应结果集
    private Map<String, Object> map = new HashMap<>();

    public Msg(int code, String message, Map<String, Object> map) {
        this.code = code;
        this.message = message;
        this.map = map;
    }

    public Msg() {
    }

    /**
     * @return 成功结果对象
     */
    public static Msg success(){
        Msg msg = new Msg();
        msg.setCode(100);
        msg.setMessage("操作成功！");
        return msg;
    }

    /**
     * @return 成功失败对象
     */
    public static Msg fail(){
        Msg msg = new Msg();
        msg.setCode(200);
        msg.setMessage("操作失败！");
        return msg;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }

    @Override
    public String toString() {
        return "Msg{" +
                "code='" + code + '\'' +
                ", message='" + message + '\'' +
                ", map=" + map +
                '}';
    }

    public Msg add(String key, Object result) {
        this.getMap().put(key, result);
        return this;
    }
}
