package com.cao.myeblog.template;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cao.myeblog.common.templates.DirectiveHandler;
import com.cao.myeblog.common.templates.TemplateDirective;
import com.cao.myeblog.service.PostService;
import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Map;

@Component
public class PostsTemplate extends TemplateDirective {
    @Autowired
    PostService postService;

    @Override
    public String getName() {
        return "posts";
    }

    @Override
    public void execute(DirectiveHandler handler) throws Exception {
        Integer level = handler.getInteger("level");
        Integer pn = handler.getInteger("pn", 1);
        Integer size = handler.getInteger("size", 2);
        Long categoryId = handler.getLong("categoryId");
        IPage page = postService.paging(new Page(pn, size), categoryId, null, level, null, "created");
        handler.put(RESULTS,page).render();
    }
}
