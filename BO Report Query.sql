WITH T_DATA AS(
(select DISTINCT ted1.link_doc_id
  from tmaac_emd_info_details ted1
 where TED1.REF_DATE_OF_ISSUE BETWEEN Trunc(To_Date('26-AUG-2019','DD-Mon-RRRR'),'MM') AND LAST_DAY('26-AUG-2019')))
select ted.iss_airline,ted.trans_doc_no,'E' TRANS_TYP,batch_hdr_key5 from tmaac_emd_info_details ted  ,T_DATA T
where  TED.LINK_DOC_ID IN (T.LINK_DOC_ID )
union
select ted.ref_iss_airline,ted.ref_doc_no,'S' TRANS_TYP,batch_hdr_key5  from tmaac_emd_info_details ted ,T_DATA T
where  TED.LINK_DOC_ID IN (T.LINK_DOC_ID )
union
select ted.iss_airline,ted.trans_doc_no,'E' TRANS_TYP,batch_hdr_key5 from tmaac_emd_info_details ted ,T_DATA T
where  TED.LINK_DOC_ID IN (T.LINK_DOC_ID )
union
select ted.ref_iss_airline,ted.ref_doc_no,'S' TRANS_TYP,batch_hdr_key5 from tmaac_emd_info_details ted ,T_DATA T
where  TED.LINK_DOC_ID IN (T.LINK_DOC_ID )