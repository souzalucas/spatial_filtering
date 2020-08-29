pkg load image;

# Carregando imagem de entrada
img_entrada = imread("unnamed.jpg");

# Convertendo para im2double
img_entrada = im2double(img_entrada);

# Criando filtro 9x9
filtro = ones(9,9);
filtro = filtro./81;

# Aplicando filtro na imagem
img_media = filter2(b = filtro, x = img_entrada, shape = "same");

# Exibindo a imagem
figure, imshow(img_media);
# A imagem agora aparenta bordas escuras

# Replicar os pixels
img_replicada = padarray(img_entrada, [4 4], "replicate");

# Aplicando filtro na imagem com os pixeis replicados
img_media_2 = filter2(b = filtro, x = img_replicada, shape = "valid");

# Exibindo a imagem
figure, imshow(img_media_2);

# Criando filtros Sobel
sobel_1 = [-1 -2 -1; 0 0 0; 1 2 1];
sobel_2 = [-1 0 1; -2 0 2; -1 0 1];

# Replicando os pixels, agora 3x3
img_replicada_2 = padarray(img_entrada, [1 1], "replicate");

# Aplicando os dois filtros
img_sobel_1 = filter2(b = sobel_1, x = img_replicada_2, shape = "valid");
img_sobel_2 = filter2(b = sobel_2, x = img_replicada_2, shape = "valid");

## Calculando a magnitude

# Obtendo valor absoluto das imagens
img_sobel_1 = abs(img_sobel_1);
img_sobel_2 = abs(img_sobel_2);

# Soma dos valores absolutos
M = img_sobel_1 .+ img_sobel_2;

# Exibindo a imagem
figure, imshow(M);