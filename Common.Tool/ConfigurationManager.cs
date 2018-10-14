using Microsoft.AspNetCore;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using System.Text;

namespace Common.Tool
{
    public class ConfigurationManager
    {
        /// <summary>
        /// 这里固定配置文件读取的目录
        /// 暂不允许修改,在此类中,全部路径都用此变量的地址
        /// </summary>
        private static string _defaultConfigPath = AppDomain.CurrentDomain.BaseDirectory;

        /// <summary>
        /// 默认配置文件名称
        /// </summary>
        private static string _defaultConfigFileName = "appsettings.json";

        /// <summary>
        /// 默认配置文件全路径
        /// </summary>
        private static string defaultConfigFullPath = _defaultConfigPath + _defaultConfigFileName;

        /// <summary>
        /// 读取配置文件后的json数据转对象
        /// </summary>
        private static JObject configjsonData;

        static ConfigurationManager()
        {
            ConfigFinder(defaultConfigFullPath);
        }

        /// <summary>
        /// 读取路径下的配置文件
        /// </summary>
        private static void ConfigFinder(string path)
        {
            if (configjsonData == null)
            {
                configjsonData = new JObject();
                FileInfo config_info = new FileInfo(defaultConfigFullPath);
                if (!config_info.Exists)
                {
                    throw new Exception("在路径下未找到配置文件,请检查!" + defaultConfigFullPath);
                }
                configjsonData = LoadJsonFile(path);
            }
        }

        /// <summary>
        /// 解析Json文件
        /// </summary>
        /// <param name="FilePath">文件路径</param>
        private static JObject LoadJsonFile(string FilePath)
        {
            JObject configCreate = null;
            try
            {
                StreamReader sr = new StreamReader(FilePath, Encoding.Default);
                configCreate = JObject.Parse(sr.ReadToEnd());
                sr.Close();
            }
            catch   //异常要捕获,不然会传到外面去.但不用坐任何事,代码直接运行下去,有啥返回啥
            {
            }
            return configCreate;
        }

        /// <summary>
        /// 只读属性
        /// 返回配置文件的整体json对象
        /// </summary>
        public static JObject AppSettings
        {
            get { return configjsonData; }
        }
    }
}