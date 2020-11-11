package zy.news.web.ui.param;

import lombok.Data;
import maoko.common.agorithm.AesCipher;

/**
 * @author maoko
 * @date 2020/3/25 11:31
 */
@Data
public class SafePass {
    private String passwd;
    private Long id;
}
