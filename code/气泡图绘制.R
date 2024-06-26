setwd("D://A-编程//lens数据分析") 

df_cited_a<-read.csv("被引论文_第一阶段_学科主题.csv")
df_cited_b<-read.csv("被引论文_第二阶段_学科主题.csv")
df_cited_c<-read.csv("被引论文_第三阶段_学科主题.csv")
df_cited_d<-read.csv("被引论文_第四阶段_学科主题.csv")

library(reshape2)
library(ggplot2)                          
#注释：package使用之前需要调???

#设置字体
windowsFonts(
  Times = windowsFont("Times New Roman"),
  ST = windowsFont("宋体")
)


myfunction<-function(df,l){
  p<-ggplot(df, aes(x = Discipline , y = Topic, size = Quantity, color=Discipline))+ geom_point()+
    #labs(x=NULL,y=NULL)+ #设置坐标轴标???
    #guides(color = guide_legend( ncol = 1, byrow = True))+ #设置图例为一???
    guides(color = "none")+ #隐藏颜色图例
    #scale_size(range=c(0, 5))+
    theme(panel.background = element_blank(), #设置背景???
          panel.grid.major = element_line(colour = "gray"), #线条
          panel.border = element_rect(colour="black",fill=NA), #边框黑色
          plot.margin=margin(t=5, #上边???(top)
                        r=10, #右边???(right)
                        b=5, #下边???(bottom)
                        l=l, #左边???(left)
                        unit = 'pt'
                        ),
          #legend.position = "none",
          axis.text.x = element_text(angle=45, hjust = 1, size = 5, family = "Times New Roman"),
          axis.text.y = element_text(size = 6, family = "Times New Roman"),
          axis.text = element_text(size = 6, family = "Times New Roman"),
          axis.title = element_text(size = 8, family = "Times New Roman"),
          legend.text = element_text(size =6, family = "Times New Roman"),
          legend.title = element_text(size =8, family = "Times New Roman"),
          legend.key.size = unit(2,"pt"), #图例符号大小
          legend.direction = "vertical", #图例方向
          legend.spacing = unit(0.01, "cm"),
          legend.spacing.x = unit(0.01, "cm"),
          )
  return(p)
}

p1=myfunction(df=df_cited_a,l=20)
p2=myfunction(df=df_cited_b,l=0)
p3=myfunction(df=df_cited_c,l=20)
p4=myfunction(df=df_cited_d,l=0)

layout<-gridExtra::grid.arrange(p1,p2,p3,p4,
                        layout_matrix=rbind(c(1,2),c(3,4)))

ggsave("cited_bubble.png",layout,width=10,height=8,dpi=2400)




df_citing_e<-read.csv("施引专利_第一阶段_学科主题.csv")
df_citing_f<-read.csv("施引专利_第二阶段_学科主题.csv")
df_citing_g<-read.csv("施引专利_第三阶段_学科主题.csv")
df_citing_h<-read.csv("施引专利_第四阶段_学科主题.csv")
df_citing_i<-read.csv("施引专利_第五阶段_学科主题.csv")
myfunction_1<-function(df,l){
  p<-ggplot(df, aes(x = IPC , y = Topic, size = Quantity, color=IPC))+ geom_point()+
    #labs(x=NULL,y=NULL)+ #设置坐标轴标???
    #guides(color = guide_legend( ncol = 1, byrow = True))+ #设置图例为一???
    guides(color = "none")+ #隐藏颜色图例
    #scale_size(range=c(0, 5))+
    theme(panel.background = element_blank(), #设置背景???
          panel.grid.major = element_line(colour = "gray"), #线条
          panel.border = element_rect(colour="black",fill=NA), #边框黑色
          plot.margin=margin(t=5, #上边???(top)
                             r=10, #右边???(right)
                             b=5, #下边???(bottom)
                             l=l, #左边???(left)
                             unit = 'pt'
          ),
          #legend.position = "none",
          axis.text.x = element_text(angle=45, hjust = 1, size = 5, family = "Times New Roman"),
          axis.text.y = element_text(size = 6, family = "Times New Roman"),
          axis.text = element_text(size = 6, family = "Times New Roman"),
          axis.title = element_text(size = 8, family = "Times New Roman"),
          legend.text = element_text(size =6, family = "Times New Roman"),
          legend.title = element_text(size =8, family = "Times New Roman"),
          legend.key.size = unit(2,"pt"), #图例符号大小
          legend.direction = "vertical", #图例方向
          legend.spacing = unit(0.01, "cm"),
          legend.spacing.x = unit(0.01, "cm"),
    )
  return(p)
}

p5<-myfunction_1(df=df_citing_e,l=5)
p6<-myfunction_1(df=df_citing_f,l=5)
p7<-myfunction_1(df=df_citing_g,l=5)
p8<-myfunction_1(df=df_citing_h,l=5)
p9<-myfunction_1(df=df_citing_i,l=5)
layout1<-gridExtra::grid.arrange(p5,p6,p7,p8,p9,
                                layout_matrix=rbind(c(1,2),c(3,4),c(5,6))
                                )
ggsave("citing_bubble.png",layout1,width=10,height=8,dpi=2400)

