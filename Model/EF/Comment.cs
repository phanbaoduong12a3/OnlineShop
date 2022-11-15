namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Comment")]
    public partial class Comment
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long ID { get; set; }

        public string CommentMsg { get; set; }

        public DateTime? CommentDate { get; set; }

        public long ProductID { get; set; }

        public long UserID { get; set; }

        public long ParentID { get; set; }

        public int Rate { get; set; }
    }
}
