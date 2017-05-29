--
-- Dumping data
--

INSERT INTO `role` VALUES (1,'ROLE_USER');

INSERT INTO `user_account` VALUES (1,'username', 'test@mail.local','$2a$11$I186oy5zBV1pMSA3wQo6iO0RhYKNkzG7XB.n1hCVKq7q6MzOlM29C');
INSERT INTO `user_account` VALUES (2,'username1', 'test1@mail.local','$2a$11$I186oy5zBV1pMSA3wQo6iO0RhYKNkzG7XB.n1hCVKq7q6MzOlM29C');

INSERT INTO `user_role` VALUES (1,1);
INSERT INTO `user_role` VALUES (2,1);

-- 
-- Set auto_increment

ALTER TABLE `role` AUTO_INCREMENT=1;
ALTER TABLE `user_account` AUTO_INCREMENT=2;