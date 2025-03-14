CREATE TABLE `file` (
    `id` BIGINT NOT NULL AUTO_INCREMENT UNIQUE COMMENT '文件ID',
    `file_name` VARCHAR(255) COMMENT '文件名',
    `file_path` VARCHAR(255) COMMENT '文件路径',
    `file_view_path` VARCHAR(255) COMMENT '文件访问路径',
    `related_type` VARCHAR(255) COMMENT '关联类型',
    `related_id` BIGINT COMMENT '关联ID',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY(`id`),
    KEY `idx_related` (`related_type`, `related_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文件表';

-- 用户相关表
CREATE TABLE `user` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    `username` VARCHAR(50) NOT NULL COMMENT '用户名',
    `password` VARCHAR(100) NOT NULL COMMENT '密码(加密存储)',
    `phone` VARCHAR(20) COMMENT '手机号',
    `email` VARCHAR(100) COMMENT '邮箱',
    `avatar` VARCHAR(255) COMMENT '头像',
    `status` TINYINT NOT NULL DEFAULT 1 COMMENT '状态(0禁用,1启用)',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`),
    UNIQUE KEY `idx_phone` (`phone`),
    UNIQUE KEY `idx_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

CREATE TABLE `user_address` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '地址ID',
    `user_id` BIGINT NOT NULL COMMENT '用户ID',
    `receiver` VARCHAR(50) NOT NULL COMMENT '收货人',
    `phone` VARCHAR(20) NOT NULL COMMENT '联系电话',
    `province` VARCHAR(20) NOT NULL COMMENT '省份',
    `city` VARCHAR(20) NOT NULL COMMENT '城市',
    `district` VARCHAR(20) NOT NULL COMMENT '区/县',
    `detail_address` VARCHAR(200) NOT NULL COMMENT '详细地址',
    `is_default` TINYINT NOT NULL DEFAULT 0 COMMENT '是否默认(0否,1是)',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户地址表';

CREATE TABLE `user_favorite` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '收藏ID',
    `user_id` BIGINT NOT NULL COMMENT '用户ID',
    `item_type` VARCHAR(20) NOT NULL COMMENT '收藏类型(pet/product)',
    `item_id` BIGINT NOT NULL COMMENT '收藏项ID',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_user_item` (`user_id`, `item_type`, `item_id`),
    KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户收藏表';

-- 宠物相关表
CREATE TABLE `pet_category` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '分类ID',
    `name` VARCHAR(50) NOT NULL COMMENT '分类名称',
    `parent_id` BIGINT DEFAULT 0 COMMENT '父分类ID',
    `level` INT NOT NULL DEFAULT 1 COMMENT '层级',
    `sort` INT NOT NULL DEFAULT 0 COMMENT '排序',
    `status` TINYINT NOT NULL DEFAULT 1 COMMENT '状态(0禁用,1启用)',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='宠物分类表';

CREATE TABLE `pet_category` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '宠物ID',
    `pet_code` VARCHAR(50) NOT NULL COMMENT '宠物编号',
    `name` VARCHAR(50) NOT NULL COMMENT '名称',
    `gender` TINYINT NOT NULL COMMENT '性别(0未知,1公,2母)',
    `age` INT COMMENT '年龄(月份)',
    `breed` VARCHAR(50) NOT NULL COMMENT '品种',
    `category_id` BIGINT NOT NULL COMMENT '分类ID',
    `enter_date` DATE NOT NULL COMMENT '入店日期',
    `price` DECIMAL(10,2) NOT NULL COMMENT '售价',
    `status` TINYINT NOT NULL DEFAULT 0 COMMENT '销售状态(0未售出,1已预订,2已售出)',
    `description` TEXT COMMENT '描述',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_pet_code` (`pet_code`),
    KEY `idx_category` (`category_id`),
    KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='宠物表';

CREATE TABLE `pet_health` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '档案ID',
    `pet_id` BIGINT NOT NULL COMMENT '宠物ID',
    `health_code` VARCHAR(50) NOT NULL COMMENT '档案编号',
    `vaccine_type` VARCHAR(100) COMMENT '疫苗类型',
    `injection_date` DATE COMMENT '接种日期',
    `valid_until` DATE COMMENT '有效期',
    `weight` DECIMAL(5,2) COMMENT '体重(kg)',
    `health_status` VARCHAR(50) COMMENT '健康状态',
    `notes` TEXT COMMENT '备注',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_health_code` (`health_code`),
    KEY `idx_pet_id` (`pet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='宠物健康档案表';

-- 商品相关表
CREATE TABLE `product_category` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '分类ID',
    `name` VARCHAR(50) NOT NULL COMMENT '分类名称',
    `parent_id` BIGINT DEFAULT 0 COMMENT '父分类ID',
    `level` INT NOT NULL DEFAULT 1 COMMENT '层级',
    `sort` INT NOT NULL DEFAULT 0 COMMENT '排序',
    `status` TINYINT NOT NULL DEFAULT 1 COMMENT '状态(0禁用,1启用)',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品分类表';

CREATE TABLE `brand` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '品牌ID',
    `name` VARCHAR(50) NOT NULL COMMENT '品牌名称',
    `logo` VARCHAR(255) COMMENT '品牌logo',
    `description` VARCHAR(255) COMMENT '品牌描述',
    `sort` INT DEFAULT 0 COMMENT '排序',
    `status` TINYINT NOT NULL DEFAULT 1 COMMENT '状态(0禁用,1启用)',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='品牌表';

CREATE TABLE `product` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '商品ID',
    `name` VARCHAR(100) NOT NULL COMMENT '商品名称',
    `category_id` BIGINT NOT NULL COMMENT '分类ID',
    `brand` VARCHAR(50) COMMENT '品牌',
    `original_price` DECIMAL(10,2) COMMENT '原价',
    `price` DECIMAL(10,2) NOT NULL COMMENT '售价',
    `stock` INT NOT NULL DEFAULT 0 COMMENT '库存量',
    `status` TINYINT NOT NULL DEFAULT 1 COMMENT '状态(0下架,1上架)',
    `description` TEXT COMMENT '描述',
    `specs` VARCHAR(255) COMMENT '规格',
    `is_new` TINYINT DEFAULT 0 COMMENT '是否新品(0否,1是)',
    `is_hot` TINYINT DEFAULT 0 COMMENT '是否热销(0否,1是)',
    `sales` INT DEFAULT 0 COMMENT '销量',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_category_id` (`category_id`),
    KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品表';

-- 订单相关表
CREATE TABLE `cart` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '购物车ID',
    `user_id` BIGINT NOT NULL COMMENT '用户ID',
    `item_type` VARCHAR(20) NOT NULL COMMENT '商品类型(pet/product)',
    `item_id` BIGINT NOT NULL COMMENT '商品ID',
    `quantity` INT NOT NULL DEFAULT 1 COMMENT '数量',
    `price` DECIMAL(10,2) NOT NULL COMMENT '单价',
    `selected` TINYINT NOT NULL DEFAULT 1 COMMENT '是否选中(0否,1是)',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_user_item` (`user_id`, `item_type`, `item_id`),
    KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='购物车表';

CREATE TABLE `orders` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '订单ID',
    `order_no` VARCHAR(50) NOT NULL COMMENT '订单编号',
    `user_id` BIGINT NOT NULL COMMENT '用户ID',
    `total_amount` DECIMAL(10,2) NOT NULL COMMENT '总金额',
    `pay_amount` DECIMAL(10,2) NOT NULL COMMENT '实付金额',
    `freight_amount` DECIMAL(10,2) DEFAULT 0 COMMENT '运费',
    `discount_amount` DECIMAL(10,2) DEFAULT 0 COMMENT '优惠金额',
    `coupon_id` BIGINT COMMENT '优惠券ID',
    `status` TINYINT NOT NULL DEFAULT 0 COMMENT '订单状态(0待付款,1待发货,2已发货,3已完成,4已取消,5退款中,6已退款)',
    `pay_type` TINYINT COMMENT '支付方式(1支付宝,2微信,3银行卡)',
    `pay_time` DATETIME COMMENT '支付时间',
    `delivery_time` DATETIME COMMENT '发货时间',
    `receive_time` DATETIME COMMENT '收货时间',
    `complete_time` DATETIME COMMENT '完成时间',
    `address_id` BIGINT COMMENT '收货地址ID',
    `receiver` VARCHAR(50) COMMENT '收货人',
    `phone` VARCHAR(20) COMMENT '联系电话',
    `address` VARCHAR(255) COMMENT '收货地址',
    `note` VARCHAR(255) COMMENT '订单备注',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_order_no` (`order_no`),
    KEY `idx_user_id` (`user_id`),
    KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

CREATE TABLE `order_item` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '明细ID',
    `order_id` BIGINT NOT NULL COMMENT '订单ID',
    `order_no` VARCHAR(50) NOT NULL COMMENT '订单编号',
    `item_type` VARCHAR(20) NOT NULL COMMENT '商品类型(pet/product)',
    `item_id` BIGINT NOT NULL COMMENT '商品ID',
    `item_name` VARCHAR(100) NOT NULL COMMENT '商品名称',
    `quantity` INT NOT NULL COMMENT '数量',
    `price` DECIMAL(10,2) NOT NULL COMMENT '单价',
    `subtotal` DECIMAL(10,2) NOT NULL COMMENT '小计',
    `item_image` VARCHAR(255) COMMENT '商品图片',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`),
    KEY `idx_order_id` (`order_id`),
    KEY `idx_order_no` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单明细表';

CREATE TABLE `payment` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '支付ID',
    `order_id` BIGINT NOT NULL COMMENT '订单ID',
    `order_no` VARCHAR(50) NOT NULL COMMENT '订单编号',
    `user_id` BIGINT NOT NULL COMMENT '用户ID',
    `payment_no` VARCHAR(100) COMMENT '支付流水号',
    `payment_method` TINYINT NOT NULL COMMENT '支付方式(1支付宝,2微信,3银行卡)',
    `amount` DECIMAL(10,2) NOT NULL COMMENT '支付金额',
    `status` TINYINT NOT NULL DEFAULT 0 COMMENT '支付状态(0未支付,1支付成功,2支付失败,3已退款)',
    `payment_time` DATETIME COMMENT '支付时间',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_order_id` (`order_id`),
    KEY `idx_order_no` (`order_no`),
    KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付记录表';

-- 营销相关表
CREATE TABLE `coupon` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '优惠券ID',
    `name` VARCHAR(100) NOT NULL COMMENT '优惠券名称',
    `type` TINYINT NOT NULL COMMENT '类型(1满减券,2折扣券,3无门槛券)',
    `value` DECIMAL(10,2) NOT NULL COMMENT '面值',
    `min_amount` DECIMAL(10,2) DEFAULT 0 COMMENT '使用门槛',
    `total` INT NOT NULL COMMENT '发行数量',
    `remain` INT NOT NULL COMMENT '剩余数量',
    `limit_per_user` INT DEFAULT 1 COMMENT '每人限领数量',
    `start_time` DATETIME NOT NULL COMMENT '开始时间',
    `end_time` DATETIME NOT NULL COMMENT '结束时间',
    `status` TINYINT NOT NULL DEFAULT 1 COMMENT '状态(0无效,1有效)',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='优惠券表';

CREATE TABLE `user_coupon` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `user_id` BIGINT NOT NULL COMMENT '用户ID',
    `coupon_id` BIGINT NOT NULL COMMENT '优惠券ID',
    `status` TINYINT NOT NULL DEFAULT 0 COMMENT '状态(0未使用,1已使用,2已过期)',
    `use_time` DATETIME COMMENT '使用时间',
    `order_id` BIGINT COMMENT '订单ID',
    `get_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '领取时间',
    PRIMARY KEY (`id`),
    KEY `idx_user_id` (`user_id`),
    KEY `idx_coupon_id` (`coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户优惠券表';

CREATE TABLE `promotion` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '活动ID',
    `name` VARCHAR(100) NOT NULL COMMENT '活动名称',
    `type` TINYINT NOT NULL COMMENT '活动类型(1满减,2折扣,3秒杀,4新品推广)',
    `description` VARCHAR(255) COMMENT '活动描述',
    `start_time` DATETIME NOT NULL COMMENT '开始时间',
    `end_time` DATETIME NOT NULL COMMENT '结束时间',
    `status` TINYINT NOT NULL DEFAULT 1 COMMENT '状态(0无效,1有效)',
    `rules` TEXT COMMENT '活动规则(JSON格式)',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='活动表';

CREATE TABLE `promotion_item` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `promotion_id` BIGINT NOT NULL COMMENT '活动ID',
    `item_type` VARCHAR(20) NOT NULL COMMENT '商品类型(pet/product)',
    `item_id` BIGINT NOT NULL COMMENT '商品ID',
    `promotion_price` DECIMAL(10,2) COMMENT '促销价格',
    `promotion_stock` INT COMMENT '促销库存',
    `limit_per_user` INT DEFAULT 0 COMMENT '每人限购',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_promotion_item` (`promotion_id`, `item_type`, `item_id`),
    KEY `idx_promotion_id` (`promotion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='活动商品表';

-- 内容管理相关表
CREATE TABLE `announcement` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '公告ID',
    `title` VARCHAR(100) NOT NULL COMMENT '公告标题',
    `content` TEXT NOT NULL COMMENT '公告内容',
    `status` TINYINT NOT NULL DEFAULT 1 COMMENT '状态(0下线,1上线)',
    `sort` INT DEFAULT 0 COMMENT '排序',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='公告表';

CREATE TABLE `banner` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '轮播图ID',
    `title` VARCHAR(100) COMMENT '标题',
    `url` VARCHAR(255) COMMENT '链接地址',
    `sort` INT NOT NULL DEFAULT 0 COMMENT '排序',
    `status` TINYINT NOT NULL DEFAULT 1 COMMENT '状态(0下线,1上线)',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='轮播图表';

-- 系统日志相关表
CREATE TABLE `operation_log` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '日志ID',
    `user_id` BIGINT COMMENT '用户ID',
    `username` VARCHAR(50) COMMENT '用户名',
    `module` VARCHAR(50) COMMENT '操作模块',
    `operation` VARCHAR(50) COMMENT '操作类型',
    `method` VARCHAR(100) COMMENT '请求方法',
    `params` TEXT COMMENT '请求参数',
    `ip` VARCHAR(50) COMMENT 'IP地址',
    `status` TINYINT DEFAULT 1 COMMENT '操作状态(0失败,1成功)',
    `error_msg` VARCHAR(255) COMMENT '错误消息',
    `operation_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
    PRIMARY KEY (`id`),
    KEY `idx_user_id` (`user_id`),
    KEY `idx_operation_time` (`operation_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='操作日志表';
