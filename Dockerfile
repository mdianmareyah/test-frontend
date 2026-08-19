FROM nginx:1.27-alpine
 
# nginx.conf n'est plus copié ici : il est monté au démarrage depuis le
# ConfigMap frontend-config (voir 02-frontend-deployment.yaml). L'image
# reste ainsi indépendante de la config serveur — modifier le ConfigMap
# et redémarrer les Pods suffit, sans jamais reconstruire l'image.
COPY public/ /usr/share/nginx/html/
COPY docker-entrypoint.sh /docker-entrypoint.sh
 
RUN chmod +x /docker-entrypoint.sh
 
EXPOSE 8080
 
ENTRYPOINT ["/docker-entrypoint.sh"]
