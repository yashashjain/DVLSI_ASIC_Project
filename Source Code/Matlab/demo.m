file_id = fopen("test_10_images_final.txt",'w');
total_correct = 0;
image_row = [1201,1240,1281,1323,1370,1405,1445,1483,1526,1587];


for k = 1:10 % 1100:1593 %for 493 image test bench generation in incrasing order
     t = image_row(k);

     data_no_random = load('semeion.data');
     [maxvalue,index] = max(data_no_random(t,257:266));
     true_image = index - 1;


     img = data_no_random(t,1:256);

     reshape_img = reshape(img,16,16)';
     figure;
     imshow(reshape_img);

     %for the test bench 
     fprintf(file_id,['reset = 0;\n',...
     '#2 reset = 1;\n',...
     '#10 reset = 0;\n']);
     for i = 1:1:8
     data_in = (replace(strcat(num2str(data_no_random(t,(i-1)*32 + 1:i*32))),' ',''));
         if (i == 1)
         fprintf(file_id," true_image = 4'd%d;\n",index-1);
         fprintf(file_id," input_32bit_image_data = 32'b%s;\n",data_in);
         else
         fprintf(file_id,"#10 input_32bit_image_data = 32'b%s;\n",data_in);
         end
     end
     fprintf(file_id,'#846280;');
     fprintf(file_id,'\n\n\n\n');

     predicted_image = inference_engine(img,parameters.W10, parameters.W21);
     if (true_image == predicted_image)
        total_correct = total_correct + 1;
         disp("True_Image = ");
         disp(strcat(num2str(true_image)));
         disp("Predicted_Image = ");
         disp(strcat(num2str(predicted_image)));
     end
end
 

disp("Accuracy in 10 images: ");
disp(strcat(num2str(total_correct*10) ,"%"));
fclose(file_id);

 


