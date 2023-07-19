using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CameraStatusService
{
    public class ViewModel
    {
    }

    public class CameraStatusList
    {
        public int code { get; set; }
        public string error { get; set; }
        public Data data { get; set; }
      
}

    public class Data
    {
        [JsonProperty(PropertyName = "live-record")]
        public Dictionary<string, CameraModel> liverecord { get; set; }
        //public LiveRecord liverecord { get; set; }
    }

   
    public class LiveRecord
    {
        public Dictionary<string, CameraModel> CameraDetail { get; set; }
    }

    public class CameraModel
    {
        public Publisher publisher { get; set; }
        public object subscribers { get; set; }
        public long subcount { get; set; }
        public long subbytes { get; set; }
    }

    public class Publisher
    {
        public string id { get; set; }
        public string ip { get; set; }
        public string app { get; set; }
        public string name { get; set; }
        public string protocol { get; set; }
        public long createtime { get; set; }
        public long inbytes { get; set; }
        public long outbytes { get; set; }
        public Audio audio { get; set; }
        public Video video { get; set; }
    }

    public class Audio
    {
        public string codec { get; set; }
        public string profile { get; set; }
        public int samplerate { get; set; }
        public int channels { get; set; }
    }

    public class Video
    {
        public string codec { get; set; }
        public int width { get; set; }
        public int height { get; set; }
        public string profile { get; set; }
        public int level { get; set; }
        public int fps { get; set; }
    }

    //XML Model

    // NOTE: Generated code may require at least .NET Framework 4.5 or .NET Core/Standard 2.0.
    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    [System.Xml.Serialization.XmlRootAttribute(Namespace = "", IsNullable = false)]
    public partial class rtmp
    {

        private string nginx_versionField;

        private string nginx_rtmp_versionField;

        private string compilerField;

        private string builtField;

        private ushort pidField;

        private ushort uptimeField;

        private uint nacceptedField;

        private uint bw_inField;

        private ulong bytes_inField;

        private uint bw_outField;

        private ulong bytes_outField;

        private rtmpServer serverField;

        /// <remarks/>
        public string nginx_version
        {
            get
            {
                return this.nginx_versionField;
            }
            set
            {
                this.nginx_versionField = value;
            }
        }

        /// <remarks/>
        public string nginx_rtmp_version
        {
            get
            {
                return this.nginx_rtmp_versionField;
            }
            set
            {
                this.nginx_rtmp_versionField = value;
            }
        }

        /// <remarks/>
        public string compiler
        {
            get
            {
                return this.compilerField;
            }
            set
            {
                this.compilerField = value;
            }
        }

        /// <remarks/>
        public string built
        {
            get
            {
                return this.builtField;
            }
            set
            {
                this.builtField = value;
            }
        }

        /// <remarks/>
        public ushort pid
        {
            get
            {
                return this.pidField;
            }
            set
            {
                this.pidField = value;
            }
        }

        /// <remarks/>
        public ushort uptime
        {
            get
            {
                return this.uptimeField;
            }
            set
            {
                this.uptimeField = value;
            }
        }

        /// <remarks/>
        public uint naccepted
        {
            get
            {
                return this.nacceptedField;
            }
            set
            {
                this.nacceptedField = value;
            }
        }

        /// <remarks/>
        public uint bw_in
        {
            get
            {
                return this.bw_inField;
            }
            set
            {
                this.bw_inField = value;
            }
        }

        /// <remarks/>
        public ulong bytes_in
        {
            get
            {
                return this.bytes_inField;
            }
            set
            {
                this.bytes_inField = value;
            }
        }

        /// <remarks/>
        public uint bw_out
        {
            get
            {
                return this.bw_outField;
            }
            set
            {
                this.bw_outField = value;
            }
        }

        /// <remarks/>
        public ulong bytes_out
        {
            get
            {
                return this.bytes_outField;
            }
            set
            {
                this.bytes_outField = value;
            }
        }

        /// <remarks/>
        public rtmpServer server
        {
            get
            {
                return this.serverField;
            }
            set
            {
                this.serverField = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class rtmpServer
    {

        private rtmpServerApplication applicationField;

        /// <remarks/>
        public rtmpServerApplication application
        {
            get
            {
                return this.applicationField;
            }
            set
            {
                this.applicationField = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class rtmpServerApplication
    {

        private string nameField;

        private rtmpServerApplicationLive liveField;

        /// <remarks/>
        public string name
        {
            get
            {
                return this.nameField;
            }
            set
            {
                this.nameField = value;
            }
        }

        /// <remarks/>
        public rtmpServerApplicationLive live
        {
            get
            {
                return this.liveField;
            }
            set
            {
                this.liveField = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class rtmpServerApplicationLive
    {

        private rtmpServerApplicationLiveStream[] streamField;

        private byte nclientsField;

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("stream")]
        public rtmpServerApplicationLiveStream[] stream
        {
            get
            {
                return this.streamField;
            }
            set
            {
                this.streamField = value;
            }
        }

        /// <remarks/>
        public byte nclients
        {
            get
            {
                return this.nclientsField;
            }
            set
            {
                this.nclientsField = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class rtmpServerApplicationLiveStream
    {

        private string nameField;

        private uint timeField;

        private uint bw_inField;

        private uint bytes_inField;

        private uint bw_outField;

        private uint bytes_outField;

        private ushort bw_audioField;

        private uint bw_videoField;

        private rtmpServerApplicationLiveStreamClient[] clientField;

        private rtmpServerApplicationLiveStreamMeta metaField;

        private byte nclientsField;

        private object publishingField;

        private string activeField;

        /// <remarks/>
        public string name
        {
            get
            {
                return this.nameField;
            }
            set
            {
                this.nameField = value;
            }
        }

        /// <remarks/>
        public uint time
        {
            get
            {
                return this.timeField;
            }
            set
            {
                this.timeField = value;
            }
        }

        /// <remarks/>
        public uint bw_in
        {
            get
            {
                return this.bw_inField;
            }
            set
            {
                this.bw_inField = value;
            }
        }

        /// <remarks/>
        public uint bytes_in
        {
            get
            {
                return this.bytes_inField;
            }
            set
            {
                this.bytes_inField = value;
            }
        }

        /// <remarks/>
        public uint bw_out
        {
            get
            {
                return this.bw_outField;
            }
            set
            {
                this.bw_outField = value;
            }
        }

        /// <remarks/>
        public uint bytes_out
        {
            get
            {
                return this.bytes_outField;
            }
            set
            {
                this.bytes_outField = value;
            }
        }

        /// <remarks/>
        public ushort bw_audio
        {
            get
            {
                return this.bw_audioField;
            }
            set
            {
                this.bw_audioField = value;
            }
        }

        /// <remarks/>
        public uint bw_video
        {
            get
            {
                return this.bw_videoField;
            }
            set
            {
                this.bw_videoField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute("client")]
        public rtmpServerApplicationLiveStreamClient[] client
        {
            get
            {
                return this.clientField;
            }
            set
            {
                this.clientField = value;
            }
        }

        /// <remarks/>
        public rtmpServerApplicationLiveStreamMeta meta
        {
            get
            {
                return this.metaField;
            }
            set
            {
                this.metaField = value;
            }
        }

        /// <remarks/>
        public byte nclients
        {
            get
            {
                return this.nclientsField;
            }
            set
            {
                this.nclientsField = value;
            }
        }

        /// <remarks/>
        public object publishing
        {
            get
            {
                return this.publishingField;
            }
            set
            {
                this.publishingField = value;
            }
        }

        /// <remarks/>
        public string active
        {
            get
            {
                return this.activeField;
            }
            set
            {
                this.activeField = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class rtmpServerApplicationLiveStreamClient
    {

        private uint idField;

        private string addressField;

        private uint timeField;

        private string flashverField;

        private byte droppedField;

        private int avsyncField;

        private uint timestampField;

        private object publishingField;

        private object activeField;

        /// <remarks/>
        public uint id
        {
            get
            {
                return this.idField;
            }
            set
            {
                this.idField = value;
            }
        }

        /// <remarks/>
        public string address
        {
            get
            {
                return this.addressField;
            }
            set
            {
                this.addressField = value;
            }
        }

        /// <remarks/>
        public uint time
        {
            get
            {
                return this.timeField;
            }
            set
            {
                this.timeField = value;
            }
        }

        /// <remarks/>
        public string flashver
        {
            get
            {
                return this.flashverField;
            }
            set
            {
                this.flashverField = value;
            }
        }

        /// <remarks/>
        public byte dropped
        {
            get
            {
                return this.droppedField;
            }
            set
            {
                this.droppedField = value;
            }
        }

        /// <remarks/>
        public int avsync
        {
            get
            {
                return this.avsyncField;
            }
            set
            {
                this.avsyncField = value;
            }
        }

        /// <remarks/>
        public uint timestamp
        {
            get
            {
                return this.timestampField;
            }
            set
            {
                this.timestampField = value;
            }
        }

        /// <remarks/>
        public object publishing
        {
            get
            {
                return this.publishingField;
            }
            set
            {
                this.publishingField = value;
            }
        }

        /// <remarks/>
        public object active
        {
            get
            {
                return this.activeField;
            }
            set
            {
                this.activeField = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class rtmpServerApplicationLiveStreamMeta
    {

        private rtmpServerApplicationLiveStreamMetaVideo videoField;

        private rtmpServerApplicationLiveStreamMetaAudio audioField;

        /// <remarks/>
        public rtmpServerApplicationLiveStreamMetaVideo video
        {
            get
            {
                return this.videoField;
            }
            set
            {
                this.videoField = value;
            }
        }

        /// <remarks/>
        public rtmpServerApplicationLiveStreamMetaAudio audio
        {
            get
            {
                return this.audioField;
            }
            set
            {
                this.audioField = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class rtmpServerApplicationLiveStreamMetaVideo
    {

        private ushort widthField;

        private ushort heightField;

        private byte frame_rateField;

        private string codecField;

        private string profileField;

        private byte compatField;

        private decimal levelField;

        /// <remarks/>
        public ushort width
        {
            get
            {
                return this.widthField;
            }
            set
            {
                this.widthField = value;
            }
        }

        /// <remarks/>
        public ushort height
        {
            get
            {
                return this.heightField;
            }
            set
            {
                this.heightField = value;
            }
        }

        /// <remarks/>
        public byte frame_rate
        {
            get
            {
                return this.frame_rateField;
            }
            set
            {
                this.frame_rateField = value;
            }
        }

        /// <remarks/>
        public string codec
        {
            get
            {
                return this.codecField;
            }
            set
            {
                this.codecField = value;
            }
        }

        /// <remarks/>
        public string profile
        {
            get
            {
                return this.profileField;
            }
            set
            {
                this.profileField = value;
            }
        }

        /// <remarks/>
        public byte compat
        {
            get
            {
                return this.compatField;
            }
            set
            {
                this.compatField = value;
            }
        }

        /// <remarks/>
        public decimal level
        {
            get
            {
                return this.levelField;
            }
            set
            {
                this.levelField = value;
            }
        }
    }

    /// <remarks/>
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
    public partial class rtmpServerApplicationLiveStreamMetaAudio
    {

        private string codecField;

        private string profileField;

        private byte channelsField;

        private ushort sample_rateField;

        /// <remarks/>
        public string codec
        {
            get
            {
                return this.codecField;
            }
            set
            {
                this.codecField = value;
            }
        }

        /// <remarks/>
        public string profile
        {
            get
            {
                return this.profileField;
            }
            set
            {
                this.profileField = value;
            }
        }

        /// <remarks/>
        public byte channels
        {
            get
            {
                return this.channelsField;
            }
            set
            {
                this.channelsField = value;
            }
        }

        /// <remarks/>
        public ushort sample_rate
        {
            get
            {
                return this.sample_rateField;
            }
            set
            {
                this.sample_rateField = value;
            }
        }
    }



}
