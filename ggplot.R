library('tidyverse')

data()

df <- BOD

?BOD

ggplot(data = df ,  mapping = aes(x = Time ,
                                  y = demand))+
  geom_point(size = 4) + 
  geom_line(color =  'Green')

ggplot(df ,  aes(Time ,demand))+
  geom_point(size = 4) + 
  geom_line(color =  'Green')

df_2 <- CO2

df_2 %>% ggplot(aes(conc , uptake, color=Treatment))+
  geom_point(size = 2) +
  geom_smooth()

df_2 %>% ggplot(aes(conc , uptake, color=Treatment))+
  geom_point(size = 2) +
  geom_smooth(method = lm , se = F)

df_2 %>% ggplot(aes(conc , uptake, color=Treatment))+
  geom_point(size = 2) +
  geom_smooth(method = lm , se = F)+
  facet_wrap(~Type)+
  labs(title = 'Main title here')


df_2 %>% ggplot(aes(conc , uptake, color=Treatment))+
  geom_point(size = 2) +
  geom_smooth(method = lm , se = F)+
  facet_wrap(~Type)+
  labs(title = 'Main title here')+
  theme_bw()

df_2 %>% ggplot(aes(Treatment , uptake))+
  geom_boxplot()
      
df_2 %>% ggplot(aes(Treatment , uptake))+
  geom_boxplot() +
  geom_point(aes(size = conc , color = Plant))

df_2 %>% ggplot(aes(Treatment , uptake))+
  geom_boxplot() +
  geom_point(alpha= 0.5 , aes(size = conc , color = Plant))

df_2 %>% ggplot(aes(Treatment , uptake))+
  geom_boxplot() +
  geom_point(alpha= 0.5 , aes(size = conc , color = Plant))+
  coord_flip() + 
  facet_wrap(~Type)+
  theme_bw()

df3 <- mpg

df3 %>% ggplot(aes(displ , cty))+
  geom_point(aes(size = drv , color = trans))

df3 %>% ggplot(aes(displ , cty))+
  geom_point(aes(size = drv , color = trans))+
  geom_smooth()

df3 %>% ggplot(aes(displ , cty))+
  geom_point(aes(size = drv , color = trans), alpha= 0.5)+
  geom_smooth()+
  facet_wrap(~year)

df3 %>% 
  filter(cty<25)%>%
  ggplot(aes(displ , cty))+
  geom_point(aes(size = drv , color = trans), alpha= 0.5)+
  geom_smooth()+
  facet_wrap(~year)

df3 %>% 
  filter(cty<25)%>%
  ggplot(aes(displ , cty))+
  geom_point(aes(size = drv , color = trans), alpha= 0.8)+
  geom_smooth()+
  facet_wrap(~year)+
  labs(x = 'Engine Size' , 
       y = 'MpG')+
  theme_bw()
